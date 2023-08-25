import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/modules/medusa_search/components/pick_search_category.dart';
import 'package:medusa_admin/app/modules/medusa_search/components/search_chip.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../core/utils/enums.dart';
import '../../components/adaptive_back_button.dart';
import '../../components/easy_loading.dart';
import '../../orders_module/orders/components/orders_filter_view.dart';
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
    final controller = widget.controller;
    final searchCategory = controller.searchCategory;
    bool showOrderBy = switch (searchCategory) {
      SearchCategory.orders ||
      SearchCategory.products ||
      SearchCategory.groups ||
      SearchCategory.priceLists =>
        true,
      SearchCategory.draftOrders => false,
      SearchCategory.collections => false,
      SearchCategory.customers => false,
      SearchCategory.giftCards => false,
      SearchCategory.discounts => false,
    };

    bool showFilterBy = searchCategory == SearchCategory.orders ||
        searchCategory == SearchCategory.products;

    IconData sortIcon = switch (controller.sortOptions) {
      SortOptions.aZ => Icons.sort_by_alpha,
      SortOptions.zA => Icons.sort_by_alpha,
      SortOptions.dateRecent => CupertinoIcons.calendar_badge_plus,
      SortOptions.dateOld => CupertinoIcons.calendar_badge_minus,
    };

    int orderFilterCount = controller.orderFilter?.count() ?? 0;
    int productFilterCount = controller.productFilter?.count() ?? 0;
    Color filterBorderColor =
        (searchCategory == SearchCategory.orders && orderFilterCount > 0) ||
                (searchCategory == SearchCategory.products &&
                    productFilterCount > 0)
            ? ColorManager.primary
            : Colors.transparent;
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const AdaptiveBackButton(),
              Flexible(
                child: SearchTextField(
                  controller: controller.searchCtrl,
                  onSubmitted: (val) async {
                    if (val.removeAllWhitespace.isNotEmpty) {
                      controller.searchTerm = val;
                      controller.pagingController.refresh();
                      await StorageService.instance.updateSearchHistory(
                          SearchHistory(
                              text: val,
                              searchableFields: controller.searchCategory));
                    }
                  },
                  hintText: getHintText(controller.searchCategory),
                  autoFocus: true,
                  onSuffixTap: () {
                    controller.searchCtrl.clear();
                    controller.searchTerm = '';
                    controller.pagingController.refresh();
                  },
                ),
              ),
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
                        searchableField: controller.searchCategory,
                        onTap: () async {
                          await showBarModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PickSearchCategory(
                                    selectedSearchCategory:
                                        controller.searchCategory);
                              }).then((result) {
                            if (result is SearchCategory) {
                              // Groups can only be sorted to date NOT to name
                              if (result == SearchCategory.groups) {
                                controller.sortOptions = SortOptions.dateRecent;
                              }
                              controller.orderFilter = null;
                              controller.productFilter = null;
                              controller.pagingController.itemList = [];
                              controller.searchCategory = result;
                              controller.update();
                              if (controller.searchTerm.isNotEmpty) {
                                controller.pagingController.refresh();
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  if (showOrderBy)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order by',
                          style: smallTextStyle?.copyWith(color: lightWhite),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: () async {
                            final sortOption = controller.sortOptions;
                            final isGroupSelected =
                                searchCategory == SearchCategory.groups;
                            final result = await selectSortOptions(
                                context, sortOption,
                                disableAZ: isGroupSelected,
                                disableZA: isGroupSelected);
                            if (result is SortOptions) {
                              controller.sortOptions = result;
                              controller.pagingController.refresh();
                              setState(() {});
                            }
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                color:
                                    context.theme.appBarTheme.backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0))),
                            child: Row(
                              children: [
                                Icon(sortIcon, size: 18),
                                const SizedBox(width: 4.0),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (showFilterBy)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filter by',
                          style: smallTextStyle?.copyWith(color: lightWhite),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onLongPress: () {
                            if (searchCategory == SearchCategory.products) {
                              controller.productFilter = null;
                            } else if (searchCategory ==
                                SearchCategory.orders) {
                              controller.orderFilter = null;
                            }
                            controller.update();
                          },
                          onTap: () async {
                            switch (searchCategory) {
                              case SearchCategory.products:
                                loadData() async {
                                  if (controller.collections == null ||
                                      controller.tags == null) {
                                    loading(status: 'Loading data');
                                  }
                                  if (controller.collections == null) {
                                    await controller.collectionRepo
                                        .retrieveAll()
                                        .then((result) {
                                      result.when((success) {
                                        controller.collections =
                                            success.collections;
                                      }, (error) {});
                                    });
                                  }
                                  if (controller.tags == null) {
                                    await controller.productTagRepo
                                        .retrieveProductTags()
                                        .then((result) {
                                      result.when((success) {
                                        controller.tags = success.tags;
                                      }, (error) {});
                                    });
                                  }
                                  dismissLoading();
                                }

                                Future<ProductFilter?>
                                    productFilterView() async =>
                                        await showBarModalBottomSheet<
                                                ProductFilter>(
                                            context: context,
                                            builder: (context) =>
                                                ProductsFilterView(
                                                  collections:
                                                      controller.collections,
                                                  tags: controller.tags,
                                                  onResetPressed: () {
                                                    controller.productFilter =
                                                        null;
                                                    controller.update();
                                                    controller.pagingController
                                                        .refresh();
                                                    Get.back();
                                                  },
                                                  productFilter:
                                                      controller.productFilter,
                                                ));

                                await loadData().then((value) async {
                                  productFilterView().then((result) {
                                    if (result is ProductFilter) {
                                      controller.productFilter = result;
                                      controller.update();
                                      controller.pagingController.refresh();
                                    }
                                  });
                                });

                              case SearchCategory.orders:
                                loadData() async {
                                  if (controller.regions == null ||
                                      controller.salesChannels == null) {
                                    loading(status: 'Loading data');
                                  }
                                  if (controller.regions == null) {
                                    await controller.regionsRepo
                                        .retrieveAll()
                                        .then((result) {
                                      result.when((success) {
                                        controller.regions = success.regions;
                                      }, (error) {});
                                    });
                                  }
                                  if (controller.salesChannels == null) {
                                    await controller.salesChannelRepo
                                        .retrieveAll()
                                        .then((result) {
                                      result.when((success) {
                                        controller.salesChannels =
                                            success.salesChannels;
                                      }, (error) {});
                                    });
                                  }
                                  dismissLoading();
                                }

                                Future<OrderFilter?> orderFilterView() async =>
                                    await showBarModalBottomSheet<OrderFilter>(
                                        context: context,
                                        builder: (context) => OrdersFilterView(
                                              regions: controller.regions,
                                              orderFilter:
                                                  controller.orderFilter,
                                              context: context,
                                              salesChannels:
                                                  controller.salesChannels,
                                              onResetTap: () {
                                                controller.orderFilter = null;
                                                controller.update();
                                                controller.pagingController
                                                    .refresh();
                                                Get.back();
                                              },
                                            ));

                                await loadData().then((value) async {
                                  await orderFilterView().then((result) {
                                    if (result is OrderFilter) {
                                      controller.orderFilter = result;
                                      controller.update();
                                      controller.pagingController.refresh();
                                    }
                                  });
                                });
                              case SearchCategory.draftOrders:
                              case SearchCategory.collections:
                              case SearchCategory.customers:
                              case SearchCategory.groups:
                              case SearchCategory.giftCards:
                              case SearchCategory.discounts:
                              case SearchCategory.priceLists:
                            }
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                color:
                                    context.theme.appBarTheme.backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                border: Border.all(color: filterBorderColor)),
                            child: Row(
                              children: [
                                const SizedBox(width: 8.0),
                                Text('Filters ', style: smallTextStyle),
                                if (productFilterCount != 0 &&
                                    searchCategory == SearchCategory.products)
                                  Text(productFilterCount.toString(),
                                      style: smallTextStyle),
                                if (orderFilterCount != 0 &&
                                    searchCategory == SearchCategory.orders)
                                  Text(orderFilterCount.toString(),
                                      style: smallTextStyle),
                                const SizedBox(width: 4.0),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
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
