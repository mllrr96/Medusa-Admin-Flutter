import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
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
              onRefresh: () => controller.pagingController.refresh(),
              header: Platform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(height: 20, offset: 20),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  if (Platform.isIOS)
                    CupertinoSliverNavigationBar(
                      largeTitle: const Text('Orders'),
                      leading: Builder(builder: (context) {
                        return CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(CupertinoIcons.ellipsis),
                          onPressed: () {
                            context.openDrawer();
                          },
                        );
                      }),
                      trailing: Builder(builder: (context) {
                        return CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(CupertinoIcons.ellipsis),
                          onPressed: () {
                            context.openEndDrawer();
                          },
                        );
                      }),
                    ),
                  if (Platform.isAndroid)
                    SliverAppBar(
                      title: const Text('Orders'),
                      floating: true,
                      snap: true,
                      actions: [
                        Builder(builder: (context) {
                          return GetBuilder<OrdersController>(
                              builder: (controller) {
                            return InkWell(
                              onLongPress: () => controller.resetFilter(),
                              onTap: () async {
                                if (controller.regions == null ||
                                    controller.salesChannels == null) {
                                  loading(
                                      status:
                                          'Loading regions and sales channels');
                                  await Future.wait([
                                    controller.fetchRegions(),
                                    controller.fetchSalesChannels()
                                  ]).then((value) {
                                    if (value.contains(false)) {
                                      EasyLoading.showError(
                                          'Error loading regions and sales channels');
                                    } else {
                                      dismissLoading();
                                      context.openEndDrawer();
                                    }
                                  });
                                } else {
                                  context.openEndDrawer();
                                }
                              },
                              child: Chip(
                                side: BorderSide(
                                    color: (controller.orderFilter?.count() ??
                                                0) !=
                                            0
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
                                    if (controller.orderFilter?.count() !=
                                            null &&
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
                  SliverPadding(
                    padding: EdgeInsets.only(
                        bottom: 120,
                        top: orderSettings.padding,
                        left: orderSettings.padding,
                        right: orderSettings.padding),
                    sliver: PagedSliverList.separated(
                      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
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
                ],
              ),
            ),
          );
        });
  }
}
