import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/utils/platform.dart';
import 'package:medusa_admin/presentation/blocs/order_crud/order_crud_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'components/index.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView(this.orderId, {super.key});
  final String orderId;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final scrollController = ScrollController();
  final summeryKey = GlobalKey();
  final paymentKey = GlobalKey();
  final fulfillmentKey = GlobalKey();
  final customerKey = GlobalKey();
  final timelineKey = GlobalKey();
  final noteCtrl = TextEditingController();
  final refreshController = RefreshController();
  late OrderCrudBloc orderCrudBloc;

  void loadOrder() {
    orderCrudBloc.add(OrderCrudEvent.load(
      widget.orderId,
      queryParameters: {
        'expand': 'customer,billing_address,shipping_address,discounts,discounts.rule,shipping_methods,payments,items,'
            'fulfillments,fulfillments.tracking_links,returns,returns.shipping_method,returns.shipping_method.tax_lines,'
            'refunds,claims,claims.claim_items,claims.claim_items.item,claims.fulfillments,claims.return_order,'
            'claims.additional_items,claims.additional_items.variant,claims.additional_items.variant.product,'
            'swaps,swaps.return_order,swaps.additional_items,swaps.additional_items.variant,'
            'swaps.additional_items.variant.product,swaps.fulfillments,returnable_items,edits,currency,edits,region.countries,shipping_address.country',
      },
    ));
  }

  @override
  void initState() {
    orderCrudBloc = OrderCrudBloc.instance;
    loadOrder();
    super.initState();
  }

  @override
  void dispose() {
    orderCrudBloc.close();
    refreshController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocConsumer<OrderCrudBloc, OrderCrudState>(
      bloc: orderCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          order: (order) {
            refreshController.refreshCompleted();
          },
          error: (e) {
            refreshController.refreshFailed();
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Hero(tag: 'order', child: Text(tr.orderTableOrder)),
            actions: [
              state.maybeWhen(
                order: (order) => ShadButton.ghost(
                    // padding: const EdgeInsets.all(16.0),
                    size: ShadButtonSize.icon,
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          context: context,
                          actions: <SheetAction<int>>[
                            SheetAction(
                              label: tr.detailsCancelOrderHeading,
                              key: 0,
                              isDestructiveAction: true,
                            ),
                          ]).then((result) async {
                        switch (result) {
                          case 0:
                            await showTextAnswerDialog(
                              title: tr.detailsCancelOrderHeading,
                              message:
                                  tr.detailsAreYouSureYouWantToCancelTheOrder,
                              retryMessage:
                                  'Make sure to type the name "order #${order.displayId!}" to confirm order deletion.',
                              retryOkLabel: 'Retry',
                              context: context,
                              keyword: 'order #${order.displayId!}',
                              isDestructiveAction: true,
                              hintText: 'order #${order.displayId!}',
                              okLabel: 'Yes, confirm',
                            ).then((value) async {
                              if (value) {
                                // await controller.cancelOrder();
                              }
                            });
                            return;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_horiz)),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
          body: SafeArea(
            child: SmartRefresher(
              controller: refreshController,
              onRefresh: () => loadOrder(),
              child: state.maybeWhen(
                order: (order) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          child: Column(
                            children: [
                              ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  child: OrderOverview(order: order)),
                              if (kIsDesktop)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: ShadAccordion<int>.multiple(
                                          maintainState: true,
                                          children: [
                                            OrderSummery(order),
                                            OrderFulfillment(order),
                                          ],
                                        ),
                                      ),
                                      const Gap(25.0),
                                      Flexible(
                                        child: ShadAccordion<int>.multiple(
                                            maintainState: true,
                                            children: [
                                              OrderPayment(order),
                                              OrderCustomer(order),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              if (kIsMobile)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ShadAccordion<int>.multiple(
                                      maintainState: true,
                                      children: [
                                        OrderSummery(order),
                                        OrderPayment(order),
                                        OrderFulfillment(order),
                                        OrderCustomer(order),
                                        OrderTimeline(order),
                                        const Gap(25.0),
                                      ]),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (kIsDesktop)
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ShadAccordion<int>(
                            maintainState: true,
                            initialValue: 4,
                            children: [OrderTimeline(order)],
                          ),
                        ),
                      )
                  ],
                ),
                error: (e) =>
                    OrderDetailsErrorPage(e.toString(), onRetryTap: () async {
                  // await controller.fetchOrderDetails();
                  // controller.timeLineFuture =
                  //     controller.fetchTimeLine();
                }),
                loading: () => const OrderDetailsLoadingPage(),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }
}
