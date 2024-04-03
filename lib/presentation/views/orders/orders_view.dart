import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/domain/use_case/batch_job/bach_job_crud_use_case.dart';
import 'package:medusa_admin/presentation/blocs/orders/orders_bloc.dart';
import 'package:medusa_admin/presentation/views/orders_filter/orders_filter_view.dart';
import 'package:medusa_admin/presentation/views/orders/components/orders_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/order_card.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/data/models/orders_filter.dart';

@RoutePage()
class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final smartRefresherCtrl = RefreshController();
  final PagingController<int, Order> pagingController =
      PagingController<int, Order>(firstPageKey: 0, invisibleItemsThreshold: 3);
  OrderFilter? orderFilter;
  void _loadPage(int _) {
    context.read<OrdersBloc>().add(OrdersEvent.loadOrders(queryParameters: {
          'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
          ...?orderFilter?.toJson()
        }));
  }

  @override
  void initState() {
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    smartRefresherCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderPreference = PreferenceService.orderPreference;
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        state.mapOrNull(
          orders: (state) async {
            final isLastPage = state.orders.length < OrdersBloc.pageSize;
            if (smartRefresherCtrl.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.orders);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.orders.length;
              pagingController.appendPage(state.orders, nextPageKey);
            }
            if (smartRefresherCtrl.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              smartRefresherCtrl.refreshCompleted();
            }
          },
          error: (state) {
            smartRefresherCtrl.refreshFailed();
            pagingController.error = state.error;
          },
        );
      },
      child: Scaffold(
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        drawer: const AppDrawer(),
        endDrawer: Drawer(
          child: OrdersFilterView(
            orderFilter: orderFilter,
            onResetTap: () {
              setState(() => orderFilter = null);
              pagingController.refresh();
              context.maybePop();
            },
            onSubmitted: (result) {
              if (result != null) {
                setState(() => orderFilter = result);
                pagingController.refresh();
              }
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchFloatingActionButton(
                    searchCategory: SearchCategory.orders),
                Gap(4.0),
              ],
            ),
            const Gap(6.0),
            FloatingActionButton.extended(
              heroTag: UniqueKey(),
              label: const Text('Export Orders'),
              icon: const Icon(MedusaIcons.arrow_up_tray),
              onPressed: () async {
                if (await exportOrders) {
                  final result = await BatchJobCrudUseCase.instance
                      .create(BatchJobType.orderExport);
                  result.when((success) {
                    context.showSnackBar('Export started');
                  }, (error) {
                    context.showSnackBar(error.message);
                  });
                }
              },
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final ordersCount = context.select<OrdersBloc, int?>((bloc) =>
                    bloc.state.mapOrNull(
                        orders: (state) =>
                            state.count > 0 ? state.count : null));
                return Text(
                    ordersCount != null ? 'Orders ($ordersCount)' : 'Orders',
                    overflow: TextOverflow.ellipsis);
              }),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () => context.openEndDrawer(),
                    icon: Icon(Icons.sort,
                        color: (orderFilter?.count() ?? -1) > 0
                            ? Colors.red
                            : null),
                  ),
                ),
              ],
            ),
          ],
          body: SmartRefresher(
            controller: smartRefresherCtrl,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
              padding: EdgeInsets.only(
                  bottom: 120,
                  top: orderPreference.padding,
                  left: orderPreference.padding,
                  right: orderPreference.padding),
              separatorBuilder: (_, __) => const Gap(8.0),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Order>(
                animateTransitions: true,
                itemBuilder: (context, order, index) {
                  if (orderPreference.alternativeCard) {
                    return AlternativeOrderCard(order);
                  }
                  return OrderCard(order);
                },
                noItemsFoundIndicatorBuilder: (_) {
                  if ((orderFilter?.count() ?? -1) > 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No orders found'),
                        TextButton(
                            onPressed: () {
                              if (orderFilter == null ||
                                  orderFilter?.count() == 0) {
                                return;
                              }
                              setState(() {
                                orderFilter = null;
                                pagingController.refresh();
                              });
                            },
                            child: const Text('Clear filters'))
                      ],
                    );
                  }
                  return const Center(child: Text('No orders yet!'));
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const OrdersLoadingPage(),
                firstPageErrorIndicatorBuilder: (context) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> get exportOrders async => await showOkCancelAlertDialog(
        context: context,
        title: 'Export Orders',
        message: 'Are you sure you want to initialize export all orders?',
        okLabel: 'Export',
        cancelLabel: 'Cancel',
      ).then((result) => result == OkCancelResult.ok);
}
