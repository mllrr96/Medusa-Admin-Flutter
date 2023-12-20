import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/pricing_controller.dart';

@RoutePage()
class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget statusIcon(bool enabled) {
      final containerColor = enabled
          ? Colors.green.withOpacity(0.17)
          : Colors.grey.withOpacity(0.17);
      final textColor = enabled ? Colors.green : Colors.grey;
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(Icons.circle, color: textColor, size: 12),
              Icon(Icons.circle, color: containerColor, size: 24),
            ],
          ),
          Text(enabled ? 'Active' : 'Draft'),
        ],
      );
    }

    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GetBuilder<PricingController>(
        init: PricingController(priceListRepo: PriceListRepo()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Price List'),
            ),
            drawer: const AppDrawer(),
            floatingActionButton: ScrollingExpandableFab(
              controller: controller.scrollController,
              label: 'New Price List',
              icon: const Icon(Icons.add),
              onPressed: () => context.pushRoute(AddUpdatePriceListRoute()),
            ),
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: GetPlatform.isIOS
                    ? const ClassicHeader(completeText: '')
                    : const MaterialClassicHeader(),
                child: PagedListView.separated(
                  scrollController: controller.scrollController,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, indent: 16.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<PriceList>(
                    itemBuilder: (context, priceList, index) {
                      return ListTile(
                        onTap: () => context.pushRoute(PriceListDetailsRoute(id: priceList.id!)),
                        onLongPress: () => context.pushRoute(AddUpdatePriceListRoute(id: priceList.id!)),
                        title: Text(priceList.name ?? ''),
                        subtitle: Text(priceList.description ?? '',
                            style: smallTextStyle?.copyWith(color: lightWhite)),
                        trailing: statusIcon(
                            priceList.status == PriceListStatus.active
                                ? true
                                : false),
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
