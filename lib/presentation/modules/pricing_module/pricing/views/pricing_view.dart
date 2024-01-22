import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/price_list/price_lists_use_case.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/index.dart';
import '../controllers/pricing_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PricingController>(
        init: PricingController(priceListsUseCase: PriceListsUseCase.instance),
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
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Obx(() => Text(
                      controller.priceListsCount.value != 0
                          ? 'Pricing Lists (${controller.priceListsCount.value})'
                          : 'Pricing Lists',
                      overflow: TextOverflow.ellipsis)),
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async => await controller.refreshData(),
                child: PagedListView.separated(
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, indent: 16.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<PriceList>(
                    itemBuilder: (context, priceList, index) =>
                        PriceListTile(priceList),
                    firstPageProgressIndicatorBuilder: (_) =>
                        const PriceListsLoadingPage(),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
                    noItemsFoundIndicatorBuilder: (_) => const Center(
                      child: Text('No Price Lists Found'),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
