import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/orders/orders_bloc.dart';
import 'package:medusa_admin/presentation/views/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/views/orders/components/orders_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView(this.customerId, {super.key});
  final String customerId;

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {
  final PagingController<int, Order> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  late OrdersBloc ordersBloc;
  late CustomerCrudBloc customerCrudBloc;

  void _loadPage(int _) {
    ordersBloc.add(OrdersEvent.loadOrders(queryParameters: {
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      'customer_id': widget.customerId,
    }));
  }

  @override
  void initState() {
    ordersBloc = OrdersBloc.instance;
    customerCrudBloc = CustomerCrudBloc.instance;
    customerCrudBloc.add(CustomerCrudEvent.load(widget.customerId));
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    ordersBloc.close();
    customerCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      bloc: ordersBloc,
      listener: (context, state) {
        state.mapOrNull(
          orders: (state) async {
            final isLastPage = state.orders.length < OrdersBloc.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(state.orders);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.orders.length;
              pagingController.appendPage(state.orders, nextPageKey);
            }
          },
          error: (state) {
            pagingController.error = state.error;
          },
        );
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const MedusaSliverAppBar(title: Text('Customer Details')),
            BlocBuilder<CustomerCrudBloc, CustomerCrudState>(
              bloc: customerCrudBloc,
              builder: (context, state) {
                return state.maybeMap(
                    customer: (_) => SliverPersistentHeader(
                          key: const Key('customer_details_header'),
                          pinned: true,
                          delegate: Delegate(
                              _.customer,
                              ordersBloc.state.mapOrNull(
                                      orders: (state) => state.count > 0
                                          ? state.count
                                          : null) ??
                                  0, onUpdateDone: () {
                            customerCrudBloc
                                .add(CustomerCrudEvent.load(widget.customerId));
                          }),
                        ),
                    error: (e) => SliverToBoxAdapter(
                        child: Center(child: Text(e.failure.toString()))),
                    loading: (_) => SliverPersistentHeader(
                          pinned: true,
                          delegate: Delegate(
                              Customer(
                                  email: 'Medusa@js.com',
                                  createdAt: DateTime.now(),
                                  hasAccount: true),
                              0,
                              isSkeleton: true),
                        ),
                    orElse: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()));
              },
            ),
            SliverSafeArea(
              top: false,
              sliver: PagedSliverList(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<Order>(
                  itemBuilder: (context, order, index) => CustomerOrderCard(
                      order,
                      index: index,
                      onTransferTap: () async => await context
                              .pushRoute(TransferOrderRoute(order: order))
                              .then((value) {
                            if (value is bool) {
                              // controller.pagingController.refresh();
                              // CustomersController
                              //     .instance.pagingController
                              //     .refresh();
                              // OrdersController
                              //     .instance.pagingController
                              //     .refresh();
                            }
                          })),
                  noItemsFoundIndicatorBuilder: (_) =>
                      const Center(child: Text('No orders yet')),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const OrdersLoadingPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Customer customer;
  final int ordersCount;
  final bool isSkeleton;
  final void Function()? onUpdateDone;
  Delegate(this.customer, this.ordersCount,
      {this.isSkeleton = false, this.onUpdateDone});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final tr = context.tr;
    return Skeletonizer(
      enabled: isSkeleton,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: context.theme.cardColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              ColorManager.getAvatarColor(customer.email),
                          child: Text(
                              customer.firstName == null
                                  ? customer.email[0].toUpperCase()
                                  : customer.firstName![0],
                              style: largeTextStyle!
                                  .copyWith(color: Colors.white)),
                        ),
                        const SizedBox(width: 12.0),
                        Flexible(
                          child: Text(
                              customer.fullName != null
                                  ? customer.fullName!
                                  : customer.email,
                              style: mediumTextStyle),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await showModalActionSheet<int>(
                            // title: tr.manageCustomer,
                            title: customer.fullName,
                            context: context,
                            actions: <SheetAction<int>>[
                              SheetAction(label: tr.customerTableEdit, key: 0),
                            ]).then((value) async {
                          switch (value) {
                            case 0:
                              final result = await context.pushRoute(
                                  AddUpdateCustomerRoute(customer: customer));
                              if (result is bool) {
                                onUpdateDone?.call();
                              }
                              break;
                            case 1:
                              break;
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz)),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (customer.createdAt != null)
                          Text(
                            '${tr.detailsFirstSeen} ${customer.createdAt.formatDate()}',
                            style: smallTextStyle,
                          ),
                        Text('${tr.customerOrdersTableOrders}: $ordersCount',
                            style: smallTextStyle),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${tr.detailsUser}: ${customer.hasAccount.toString().capitalize}',
                          style: smallTextStyle,
                        ),
                        Text('${tr.detailsPhone}: ${customer.phone ?? 'N/A'}',
                            style: smallTextStyle),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 2.4;

  @override
  double get minExtent => kToolbarHeight * 2.4;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
