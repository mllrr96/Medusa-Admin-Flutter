import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../route/app_router.dart';
import '../../../../data/models/store/order.dart';
import '../../../../data/repository/order/orders_repo.dart';
import '../../../../data/repository/regions/regions_repo.dart';
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
        init: OrdersController(
          ordersRepository: OrdersRepo(),
          regionsRepo: RegionsRepo(),
          salesChannelRepo: SalesChannelRepo(),
        ),
        builder: (controller) {
          final orderSettings = StorageService.orderSettings;
          return Scaffold(
            drawer: const AppDrawer(),
            endDrawer: Drawer(
              shape: const RoundedRectangleBorder(),
              child: OrdersFilterView(
                regions: controller.regions,
                orderFilter: controller.orderFilter,
                context: context,
                salesChannels: controller.salesChannels,
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
                      heroTag: 'search Order',
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
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: const Text('Orders'),
                  actions: [
                    Builder(builder: (context) {
                      return GetBuilder<OrdersController>(
                          builder: (controller) {
                        return InkWell(
                          onLongPress: () => controller.resetFilter(),
                          onTap: () => Scaffold.of(context).openEndDrawer(),
                          child: Chip(
                            side: BorderSide(
                                color:
                                    (controller.orderFilter?.count() ?? 0) != 0
                                        ? ColorManager.primary
                                        : Colors.transparent),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0))),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Filters',
                                    style: context.bodySmall?.copyWith(
                                        color: ColorManager.manatee)),
                                if (controller.orderFilter?.count() != null &&
                                    controller.orderFilter?.count() != 0)
                                  Text(
                                      ' ${controller.orderFilter?.count() ?? ''}',
                                      style: context.bodySmall?.copyWith(
                                          color: ColorManager.primary)),
                              ],
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        );
                      });
                    }),
                  ],
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: GetPlatform.isIOS
                    ? const ClassicHeader(completeText: '')
                    : const MaterialClassicHeader(),
                child: PagedListView.separated(
                  scrollController: controller.scrollController,
                  separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                  padding: EdgeInsets.only(
                      bottom: 120,
                      top: orderSettings.padding,
                      left: orderSettings.padding,
                      right: orderSettings.padding),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Order>(
                      itemBuilder: (context, order, index) {
                        if (orderSettings.alternativeCard) {
                          return AlternativeOrderCard(order);
                        }
                        return OrderCard(order);
                      },
                      noItemsFoundIndicatorBuilder: (_) {
                        if (controller.orderFilter != null &&
                            controller.orderFilter?.count() != 0) {
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
                          const Center(
                              child: CircularProgressIndicator.adaptive())),
                ),
              ),
            ),
          );
        });
  }
}