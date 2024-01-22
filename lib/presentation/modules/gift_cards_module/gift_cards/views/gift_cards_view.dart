import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/domain/use_case/product/products_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/index.dart';
import '../controllers/gift_cards_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
@RoutePage()
class GiftCardsView extends StatelessWidget {
  const GiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0
        ? 12.0
        : context.mediaQueryViewPadding.bottom;
    return GetBuilder<GiftCardsController>(
        init: GiftCardsController(productsUseCase: ProductsUseCase.instance),
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
                  overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                  backgroundColor: context.theme.scaffoldBackgroundColor,
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
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Obx(() => Text(
                      controller.giftCardsCount.value != 0
                          ? 'Gift Cards (${controller.giftCardsCount.value})'
                          : 'Gift Cards',
                      overflow: TextOverflow.ellipsis)),
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async => await controller.refreshData(),
                child: PagedListView.separated(
                  pagingController: controller.pagingController,
                  padding: const EdgeInsets.only(bottom: 80),
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
                        child: Icon(Icons.circle, color: Colors.red, size: 8),
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
                            style: smallTextStyle?.copyWith(color: manatee),
                          ),
                          TextButton(
                              onPressed: () async {
                                await showBarModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) =>
                                        const CreateGiftCardView());
                              },
                              child: const Text('Create Gift Card'))
                        ],
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const GiftCardsLoadingPage(),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(
                            pagingController: controller.pagingController),
                  ),
                  separatorBuilder: (_, __) => const Divider(height: 0),
                ),
              ),
            ),
          );
        });
  }
}
