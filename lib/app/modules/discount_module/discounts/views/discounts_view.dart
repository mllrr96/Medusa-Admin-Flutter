import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/components/discounts_loading_page.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../route/app_router.dart';
import '../../../../data/repository/discount/discount_repo.dart';
import '../components/discount_card.dart';
import '../controllers/discounts_controller.dart';

@RoutePage()
class DiscountsView extends StatelessWidget {
  const DiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    return GetBuilder<DiscountsController>(
        init: DiscountsController(discountRepo: DiscountRepo()),
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
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
                          searchCategory: SearchCategory.discounts)),
                      heroTag: UniqueKey(),
                      child: const Icon(CupertinoIcons.search),
                    ),
                    const Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                  controller: controller.scrollController,
                  label: 'New Discount',
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final result = await context.pushRoute(AddUpdateDiscountRoute());
                    if (result is bool && result == true) {
                      controller.pagingController.refresh();
                    }
                  },
                ),
              ],
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.pagingController.refresh(),
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
                        controller.discountsCount.value != 0
                            ? 'Discounts (${controller.discountsCount.value})'
                            : 'Discounts',
                        overflow: TextOverflow.ellipsis)),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 80),
                    sliver: PagedSliverList.separated(
                      separatorBuilder: (_, __) => const Gap(12.0),
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Discount>(
                        itemBuilder: (context, discount, index) => DiscountCard(
                            discount,
                            onDelete: () async =>
                                await controller.deleteDiscount(id: discount.id!),
                            onToggle: () async => await controller.toggleDiscount(
                                discount: discount)),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const DiscountsLoadingPage(),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                            child: Text(
                                'No discounts yet!\n Tap on + to add discount',
                                style: largeTextStyle,
                                textAlign: TextAlign.center)),
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
