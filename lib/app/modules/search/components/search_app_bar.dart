import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/search/components/index.dart';
import 'package:medusa_admin/app/modules/search/components/pick_search_category.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/medusa_icons_icons.dart';
import '../../components/adaptive_back_button.dart';
import '../../components/easy_loading.dart';
import '../../products_module/products/components/products_filter_view.dart';
import '../controllers/medusa_search_controller.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, required this.controller});
  final MedusaSearchController controller;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2 + 16);
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
    const constraints = BoxConstraints(minWidth: 30.0, minHeight: 40);
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

    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const AdaptiveBackButton(),
              Flexible(
                  child: TextField(
                onSubmitted: (val) {
                  if (val.removeAllWhitespace.isNotEmpty) {
                    widget.controller.searchTerm = val;
                    widget.controller.pagingController.refresh();
                    StorageService.instance.updateSearchHistory(SearchHistory(
                        text: val,
                        searchableFields: widget.controller.searchCategory));
                  }
                },
                controller: widget.controller.searchCtrl,
                style: smallTextStyle,
                autofocus: true,
                autocorrect: false,
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  suffixIconConstraints: constraints,
                  suffixIcon: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: InkWell(
                      child: const Icon(CupertinoIcons.xmark_circle_fill),
                      onTap: () {
                        widget.controller.searchCtrl.clear();
                        widget.controller.searchTerm = '';
                        widget.controller.pagingController.refresh();
                      },
                    ),
                  ),
                  prefixIconConstraints: constraints,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 12.0),
                      Hero(
                          tag: 'search',
                          child: Icon(MedusaIcons.magnifying_glass_mini,
                              color: lightWhite)),
                      const SizedBox(width: 12.0),
                    ],
                  ),
                  isDense: true,
                  filled: true,
                  hintText: getHintText(widget.controller.searchCategory),
                  hintStyle: smallTextStyle?.copyWith(color: lightWhite),
                  fillColor: context.theme.appBarTheme.backgroundColor,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding: EdgeInsets.zero,
                ),
              )),
              const SizedBox(width: 12.0)
            ],
          ),
          SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search for',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      SearchChip(
                        searchableField: widget.controller.searchCategory,
                        onTap: () async {
                          await showBarModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PickSearchCategory(
                                    selectedSearchCategory:
                                        widget.controller.searchCategory);
                              }).then((result) {
                            if (result is SearchCategory) {
                              widget.controller.pagingController.itemList = [];
                              widget.controller.searchCategory = result;
                              widget.controller.update();
                              if(widget.controller.searchTerm.isNotEmpty){
                                widget.controller.pagingController.refresh();
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order by',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final sortOption = widget.controller.sortOptions;
                            final result =
                                await selectSortOptions(context, sortOption);
                            if (result is SortOptions) {
                              widget.controller.sortOptions = result;
                              widget.controller.pagingController.refresh();
                              setState(() {});
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            margin: const EdgeInsets.symmetric(vertical: 2.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: context.theme.appBarTheme.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4.0))),
                            child: Row(
                              children: [
                                Icon(getSortIcon(widget.controller.sortOptions),
                                    size: 18),
                                const SizedBox(width: 4.0),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter by',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (widget.controller.searchCategory ==
                                SearchCategory.products) {
                              await showBarModalBottomSheet(
                                  context: context,
                                  builder: (context) => ProductsFilterView(
                                        // collections: controller.collections,
                                        // tags: controller.tags,
                                        onResetPressed: () {
                                          // controller.resetFilter();
                                          Get.back();
                                        },
                                        // productFilter: controller.productFilter,
                                      )).then((result) {
                                // controller.updateFilter(result);
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            margin: const EdgeInsets.symmetric(vertical: 2.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: context.theme.appBarTheme.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4.0))),
                            child: Row(
                              children: [
                                const SizedBox(width: 8.0),
                                Text('A-Z', style: smallTextStyle),
                                const SizedBox(width: 4.0),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }

  String getHintText(SearchCategory searchableField) {
    switch (searchableField) {
      case SearchCategory.orders:
        return 'Search for orders\' email, ID';
      case SearchCategory.draftOrders:
        return 'Search for draft orders\' email, ID';
      case SearchCategory.products:
        return 'Search for product name, variant, title ...';
      case SearchCategory.collections:
        return 'Search for collection name, handle';
      case SearchCategory.customers:
        return 'Search for customer name, email, phone number ...';
      case SearchCategory.groups:
        return 'Search for group name';
      case SearchCategory.giftCards:
        return 'Search for gift card code, ID';
      case SearchCategory.discounts:
        return 'Search for discount code';
      case SearchCategory.priceLists:
        return 'search for price lists\' description, name, and customer group\'s name';
    }
  }
}
