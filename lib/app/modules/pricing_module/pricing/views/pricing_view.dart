import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/index.dart';
import '../controllers/pricing_controller.dart';

@RoutePage()
class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PricingController>(
        init: PricingController(priceListRepo: PriceListRepo()),
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            floatingActionButton: ScrollingExpandableFab(
              heroTag: UniqueKey(),
              controller: controller.scrollController,
              label: 'New Price List',
              icon: const Icon(Icons.add),
              onPressed: () => context.pushRoute(AddUpdatePriceListRoute()),
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async => await controller.refreshData(),
              header: GetPlatform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(offset: 100),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    title: Obx(() => Text(
                        controller.priceListsCount.value != 0
                            ? 'Pricing Lists (${controller.priceListsCount.value})'
                            : 'Pricing Lists',
                        overflow: TextOverflow.ellipsis)),
                  ),

                  PagedSliverList.separated(
                    separatorBuilder: (_, __) =>
                        const Divider(height: 0, indent: 16.0),
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<PriceList>(
                      itemBuilder: (context, priceList, index) => PriceListTile(priceList),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const PriceListsLoadingPage(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
