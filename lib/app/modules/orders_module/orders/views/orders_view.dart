import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_loading_page.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../route/app_router.dart';
import '../../../../data/repository/order/orders_repo.dart';
import '../../../components/adaptive_button.dart';
import '../components/order_card.dart';
import '../controllers/orders_controller.dart';
import 'package:gap/gap.dart';

@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        init: OrdersController(ordersRepository: OrdersRepo()),
        builder: (controller) {
          final orderSettings = StorageService.orderSettings;
          return Scaffold(
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            drawer: const AppDrawer(),
            endDrawer: Drawer(
              shape: const RoundedRectangleBorder(),
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => context.pushRoute(MedusaSearchRoute(
                          searchCategory: SearchCategory.orders)),
                      heroTag: UniqueKey(),
                      child: const Icon(CupertinoIcons.search),
                    ),
                    const Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                  heroTag: const ValueKey('orders fab'),
                  controller: controller.scrollController,
                  label: 'Export Orders',
                  icon: const Icon(MedusaIcons.arrow_up_tray),
                  onPressed: () {},
                ),
              ],
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async => await controller.refreshData(),
              header: Platform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(offset: 100),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    title: const Text('Orders'),
                    floating: true,
                    snap: true,
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
                  SliverPadding(
                    padding: EdgeInsets.only(
                        bottom: 120,
                        top: orderSettings.padding,
                        left: orderSettings.padding,
                        right: orderSettings.padding),
                    sliver: PagedSliverList.separated(
                      separatorBuilder: (_, __) => const Gap(8.0),
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Order>(
                        itemBuilder: (context, order, index) {
                          if (orderSettings.alternativeCard) {
                            return AlternativeOrderCard(order);
                          }
                          return OrderCard(order);
                        },
                        noItemsFoundIndicatorBuilder: (_) {
                          if ((controller.orderFilter?.count() ?? -1) > 0) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No Orders found'),
                                AdaptiveButton(
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
                ],
              ),
            ),
          );
        });
  }
}
