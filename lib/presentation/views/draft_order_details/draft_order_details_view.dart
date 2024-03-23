import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/draft_order_crud/draft_order_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'components/index.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class DraftOrderDetailsView extends StatefulWidget {
  const DraftOrderDetailsView(this.draftId, {super.key});
  final String draftId;

  @override
  State<DraftOrderDetailsView> createState() => _DraftOrderDetailsViewState();
}

class _DraftOrderDetailsViewState extends State<DraftOrderDetailsView> {
  final summeryKey = GlobalKey();
  final paymentKey = GlobalKey();
  final shippingKey = GlobalKey();
  final customerKey = GlobalKey();
  late DraftOrderCrudBloc draftOrderCrudBloc;
  @override
  void initState() {
    draftOrderCrudBloc = DraftOrderCrudBloc.instance;
    draftOrderCrudBloc.add(DraftOrderCrudEvent.load(widget.draftId));
    super.initState();
  }

  @override
  void dispose() {
    draftOrderCrudBloc.close();
    super.dispose();
  }

  TextStyle? get smallTextStyle => context.bodySmall;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocConsumer<DraftOrderCrudBloc, DraftOrderCrudState>(
      bloc: draftOrderCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          paymentRegistered: (_) {
            context.showSnackBar('Draft Order marked as paid');
          },
          error: (error) {
            context.showSnackBar(error.error.toSnackBarString());
          },
          deleted: (deleted) {
            context.showSnackBar('Draft Order Canceled');
            context.maybePop();
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MedusaSliverAppBar(
                title: const Text('Draft Order Details'),
                actions: [
                  Builder(
                    builder: (context) {
                      final isCompleted = draftOrderCrudBloc.state.mapOrNull(
                              draftOrder: (draftOrder) =>
                                  draftOrder.draftOrder.status ==
                                  DraftOrderStatus.completed) ??
                          false;
                      final isOpen = draftOrderCrudBloc.state.mapOrNull(
                              draftOrder: (draftOrder) =>
                                  draftOrder.draftOrder.status ==
                                  DraftOrderStatus.open) ??
                          false;
                      if (isCompleted) {
                        return TextButton(
                          onPressed: () => context.pushRoute(
                              OrderDetailsRoute(
                                  orderId: draftOrderCrudBloc.state.mapOrNull(
                                          draftOrder: (draftOrder) =>
                                              draftOrder
                                                  .draftOrder.orderId) ??
                                      '')),
                          child: const Text('Go to order'),
                        );
                      } else if (isOpen) {
                        return TextButton(
                          onPressed: () async {
                            await showOkCancelAlertDialog(
                              context: context,
                              title: 'Cancel Draft Order',
                              message:
                                  'Are you sure you want to cancel this draft order?',
                              okLabel: 'Yes, Cancel',
                              isDestructiveAction: true,
                            ).then((result) async {
                              if (result == OkCancelResult.ok) {
                                draftOrderCrudBloc.add(
                                    DraftOrderCrudEvent.delete(
                                        widget.draftId));
                                // await controller.cancelDraftOrder(context);
                              }
                            });
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ],
            body: state.maybeMap(
                draftOrder: (_) => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        child: Column(
                          children: [
                            DraftOrderOverview(_.draftOrder),
                            space,
                            DraftOrderSummery(
                              _.draftOrder,
                              key: summeryKey,
                            ),
                            space,
                            DraftOrderPayment(
                              _.draftOrder,
                              key: paymentKey,
                              markAsPaid: () {
                                draftOrderCrudBloc.add(
                                    DraftOrderCrudEvent.registerPayment(
                                        widget.draftId));
                              },
                            ),
                            space,
                            DraftOrderShipping(
                              _.draftOrder,
                              key: shippingKey,
                            ),
                            space,
                            DraftOrderCustomer(
                              _.draftOrder,
                              key: customerKey,
                            ),
                            space,
                          ],
                        ),
                      ),
                    ),
                error: (_) => Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(width: 12.0),
                          Flexible(
                              child: Text(
                            _.error.toString(),
                            style: smallTextStyle,
                          )),
                        ],
                      ),
                    )),
                orElse: () => const DraftOrderLoadingPage()),
          ),
        );
      },
    );
  }
}
