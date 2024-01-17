import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/modules/discount_module/discounts/components/discounts_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/domain/use_case/discounts_use_case.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/route/app_router.dart';
import '../components/discount_card.dart';
import '../controllers/discounts_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
@RoutePage()
class DiscountsView extends StatelessWidget {
  const DiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    return GetBuilder<DiscountsController>(
        init: DiscountsController(discountsUseCase: DiscountsUseCase.instance),
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchFloatingActionButton(
                        searchCategory: SearchCategory.discounts),
                    Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                  controller: controller.scrollController,
                  heroTag: UniqueKey(),
                  label: 'New Discount',
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final result =
                        await context.pushRoute(AddUpdateDiscountRoute());
                    if (result is bool && result == true) {
                      controller.pagingController.refresh();
                    }
                  },
                ),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Obx(() => Text(
                      controller.discountsCount.value != 0
                          ? 'Discounts (${controller.discountsCount.value})'
                          : 'Discounts',
                      overflow: TextOverflow.ellipsis)),
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async => await controller.refreshData(),
                child: PagedListView.separated(
                  separatorBuilder: (_, __) => const Gap(12.0),
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 80),
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
            ),
          );
        });
  }
}
