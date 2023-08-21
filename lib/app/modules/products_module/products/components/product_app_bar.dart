import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/medusa_search/controllers/medusa_search_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../components/adaptive_icon.dart';
import '../controllers/products_controller.dart';
import 'index.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final controller = ProductsController.instance;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    IconData sortIcon = switch (controller.sortOptions) {
      SortOptions.aZ => Icons.sort_by_alpha,
      SortOptions.zA => Icons.sort_by_alpha,
      SortOptions.dateRecent => CupertinoIcons.calendar_badge_plus,
      SortOptions.dateOld => CupertinoIcons.calendar_badge_minus,
    };
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      height: kToolbarHeight,
      child: GetBuilder<ProductsController>(
        builder: (controller) {
          return Row(
            children: [
              AdaptiveIcon(
                onPressed: () async => await Get.toNamed(Routes.MEDUSA_SEARCH,
                    arguments:
                        SearchReq(searchCategory: SearchCategory.products)),
                icon: const Icon(MedusaIcons.magnifying_glass),
              ),
              AdaptiveIcon(
                  onPressed: () async {
                    final sortOption = controller.sortOptions;
                    final result = await selectSortOptions(context, sortOption);
                    if (result != null) {
                      controller.changeSortOption(result);
                    }
                  },
                  icon: Icon(
                    sortIcon,
                    color: controller.sortOptions != SortOptions.dateRecent
                        ? ColorManager.primary
                        : null,
                  )),
              const SizedBox(width: 6.0),
              InkWell(
                onLongPress: () {
                  controller.resetFilter();
                },
                onTap: () async {
                  await showBarModalBottomSheet(
                      context: context,
                      builder: (context) => ProductsFilterView(
                            collections: controller.collections,
                            tags: controller.tags,
                            onResetPressed: () {
                              controller.resetFilter();
                              Get.back();
                            },
                            productFilter: controller.productFilter,
                          )).then((result) {
                            if(result is ProductFilter){
                              controller.updateFilter(result);
                            }
                  });
                },
                child: Chip(
                  side: BorderSide(
                      color: (controller.productFilter?.count() ?? 0) != 0
                          ? ColorManager.primary
                          : Colors.transparent),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Filters',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: lightWhite)),
                      if (controller.productFilter?.count() != null)
                        Text(' ${controller.productFilter?.count() ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: ColorManager.primary)),
                    ],
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
