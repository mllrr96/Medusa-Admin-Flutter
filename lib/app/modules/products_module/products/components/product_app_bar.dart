import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../collections_module/collections/controllers/collections_controller.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/search_text_field.dart';
import '../controllers/products_controller.dart';
import 'index.dart';

class ProductsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});

  @override
  State<ProductsAppBar> createState() => _ProductsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProductsAppBarState extends State<ProductsAppBar> {
  bool collectionSearch = false;
  bool productSearch = false;
  final controller = ProductsController.instance;
  final collectionCtrl = CollectionsController.instance;
  final searchNode = FocusNode();
  final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;

  IconData getSortIcon(SortOptions sortOptions) {
    switch (sortOptions) {
      case SortOptions.aZ:
        return Icons.sort_by_alpha;
      case SortOptions.zA:
        return Icons.sort_by_alpha;

      case SortOptions.dateRecent:
        return CupertinoIcons.calendar_badge_plus;

      case SortOptions.dateOld:
        return CupertinoIcons.calendar_badge_minus;
    }
  }

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);

    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      height: kToolbarHeight,
      child: AnimatedCrossFade(
        key: const ValueKey(0),
        firstChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              Expanded(
                child: SearchTextField(
                  focusNode: searchNode,
                  controller: controller.searchCtrl,
                  hintText: 'Search for product name, variant title ...',
                  onChanged: (val) {
                    if (controller.searchTerm.value != val) {
                      controller.searchTerm.value = val;
                    }
                  },
                ),
              ),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      productSearch = false;
                      controller.searchCtrl.clear();
                      if (controller.searchTerm.value.isNotEmpty) {
                        controller.searchTerm.value = '';
                      }
                    });
                  }),
            ],
          ),
        ),
        secondChild: SizedBox(
          height: kToolbarHeight,
          child: GetBuilder<ProductsController>(
            builder: (controller) {
              return Row(
                children: [
                  AdaptiveIcon(
                    onPressed: () async {
                      setState(() => productSearch = true);
                      await Future.delayed(kDuration);
                      searchNode.requestFocus();
                    },
                    icon: const Icon(MedusaIcons.magnifying_glass),
                  ),
                  AdaptiveIcon(
                      onPressed: () async {
                        final sortOption = controller.sortOptions;
                        final result = await showModalActionSheet<SortOptions>(
                            context: context,
                            title: 'Sort products',
                            actions: <SheetAction<SortOptions>>[
                              SheetAction(
                                  label: 'A-Z',
                                  key: SortOptions.aZ,
                                  isDestructiveAction:
                                      sortOption == SortOptions.aZ),
                              SheetAction(
                                  label: 'Z-A',
                                  key: SortOptions.zA,
                                  isDestructiveAction:
                                      sortOption == SortOptions.zA),
                              SheetAction(
                                  label: 'Creation Date',
                                  key: SortOptions.dateRecent,
                                  isDestructiveAction:
                                      sortOption == SortOptions.dateRecent),
                              SheetAction(
                                  label: 'Creation Date - Ascending',
                                  key: SortOptions.dateOld,
                                  isDestructiveAction:
                                      sortOption == SortOptions.dateOld),
                            ]);
                        if (result != null) {
                          controller.changeSortOption(result);
                        }
                      },
                      icon: Icon(
                        getSortIcon(controller.sortOptions),
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
                        controller.updateFilter(result);
                      });
                    },
                    child: Chip(
                      side: BorderSide(
                          color: (controller.productFilter?.count() ?? 0) != 0
                              ? ColorManager.primary
                              : Colors.transparent),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
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
        ),
        crossFadeState: productSearch
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: kDuration,
      ),
    );
  }
}
