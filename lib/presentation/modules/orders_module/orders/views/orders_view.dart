import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/domain/use_case/batch_job/create_batch_job_use_case.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/orders_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../components/order_card.dart';
import '../controllers/orders_controller.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        init: OrdersController(ordersUseCase: OrdersUseCase.instance),
        builder: (controller) {
          final orderPreference = PreferenceService.orderPreference;
          return Scaffold(
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            drawer: const AppDrawer(),
            endDrawer: Drawer(
              child: OrdersFilterView(
                orderFilter: controller.orderFilter,
                onResetTap: () {
                  controller.resetFilter();
                  context.popRoute();
                },
                onSubmitted: (result) {
                  if (result != null) {
                    controller.updateFilter(result);
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
                ScrollingExpandableFab(
                  heroTag: const ValueKey('orders fab'),
                  controller: controller.scrollController,
                  label: 'Export Orders',
                  icon: const Icon(MedusaIcons.arrow_up_tray),
                  onPressed: () async {
                    await showOkCancelAlertDialog(
                      context: context,
                      title: 'Export Orders',
                      message:
                          'Are you sure you want to initialize export all orders?',
                      okLabel: 'Export',
                      cancelLabel: 'Cancel',
                    ).then((value) async {
                      if (value == OkCancelResult.ok) {
                        final result = await CreateBatchJobUseCase.instance(
                            BatchJobType.orderExport);
                        result.when((success) {
                          context.showSnackBar('Export started');
                        }, (error) {
                          context.showSnackBar(error.message);
                        });
                      }
                    });
                  },
                ),
              ],
            ),
            body: NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Obx(
                    () => Text(
                        controller.ordersCount.value != 0
                            ? 'Orders (${controller.ordersCount.value})'
                            : 'Orders',
                        overflow: TextOverflow.ellipsis),
                  ),
                  actions: [
                    Builder(builder: (context) {
                      return GetBuilder<OrdersController>(
                          builder: (controller) {
                        final iconColor =
                            (controller.orderFilter?.count() ?? -1) > 0
                                ? Colors.red
                                : null;
                        return IconButton(
                            onPressed: () {
                              context.openEndDrawer();
                            },
                            icon: Icon(Icons.sort, color: iconColor));
                      });
                    })
                  ],
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async => await controller.refreshData(),
                child: PagedListView.separated(
                  padding: EdgeInsets.only(
                      bottom: 120,
                      top: orderPreference.padding,
                      left: orderPreference.padding,
                      right: orderPreference.padding),
                  separatorBuilder: (_, __) => const Gap(8.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Order>(
                    itemBuilder: (context, order, index) {
                      if (orderPreference.alternativeCard) {
                        return AlternativeOrderCard(order)
                            .animate()
                            .fadeIn(duration: 500.ms);
                      }
                      return OrderCard(order);
                    },
                    noItemsFoundIndicatorBuilder: (_) {
                      if ((controller.orderFilter?.count() ?? -1) > 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('No Orders found'),
                            TextButton(
                                onPressed: () => controller.resetFilter(),
                                child: const Text('Clear filters'))
                          ],
                        );
                      }

                      return const Center(child: Text('No orders yet!'));
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const OrdersLoadingPage(),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(
                            pagingController: controller.pagingController),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
