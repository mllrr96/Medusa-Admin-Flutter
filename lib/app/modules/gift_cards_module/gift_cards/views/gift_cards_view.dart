import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/index.dart';
import '../controllers/gift_cards_controller.dart';

@RoutePage()
class GiftCardsView extends StatelessWidget {
  const GiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0
        ? 12.0
        : context.mediaQueryViewPadding.bottom;
    return GetBuilder<GiftCardsController>(
        init: GiftCardsController(productsRepo: ProductsRepo()),
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            floatingActionButton: ScrollingExpandableFab(
              heroTag: UniqueKey(),
              controller: controller.scrollController,
              label: 'Gift Card',
              icon: const Icon(Icons.add),
              onPressed: () async => await showBarModalBottomSheet(
                  context: context,
                  builder: (context) => const CreateGiftCardView()),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(bottom: bottomPadding),
              decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  border: Border(
                      top: BorderSide(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.black))),
              child: ListTile(
                title: const Text('Gift Cards History'),
                subtitle: Text('See the history of purchased Gift Cards',
                    style: smallTextStyle),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => context.pushRoute(const CustomGiftCardsRoute()),
              ),
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async {
                await controller.refreshData();
              },
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
                        controller.giftCardsCount.value != 0
                            ? 'Gift Cards (${controller.giftCardsCount.value})'
                            : 'Gift Cards',
                        overflow: TextOverflow.ellipsis)),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Manage the Gift Cards of your Medusa store',
                        style: smallTextStyle?.copyWith(color: manatee),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 80),
                    sliver: PagedSliverList.separated(
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Product>(
                          itemBuilder: (context, product, index) {
                            final published =
                                product.status == ProductStatus.published;
                            final listTile = GiftCardListTile(
                              giftCard: product,
                              onToggle: () async {
                                await controller.toggleProduct(product);
                              },
                              onDelete: () async {
                                await controller.deleteProduct(product.id!);
                              },
                            );
                            const disabledDot = Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.circle, color: Colors.red, size: 8),
                            );
                            if (published) {
                              return listTile;
                            } else {
                              return Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [listTile, disabledDot],
                              );
                            }
                          },
                          noItemsFoundIndicatorBuilder: (_) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    'Are you ready to sell your first Gift Card?'),
                                Text(
                                  'No Gift Card has been added yet.',
                                  style:
                                      smallTextStyle?.copyWith(color: manatee),
                                ),
                                AdaptiveButton(
                                    onPressed: () async {
                                      await showBarModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const CreateGiftCardView());
                                    },
                                    child: const Text('Create Gift Card'))
                              ],
                            );
                          },
                          firstPageProgressIndicatorBuilder: (context) =>
                             const GiftCardsLoadingPage(),
                        ),
                        separatorBuilder: (_, __) => const Divider(height: 0),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
