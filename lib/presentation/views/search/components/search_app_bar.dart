import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/search_history.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/blocs/search/search_bloc.dart';
import 'package:medusa_admin/presentation/views/orders_filter/orders_filter_view.dart';
import 'package:medusa_admin/presentation/views/products_filter/products_filter_view.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'pick_search_category.dart';
import 'search_chip.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/data/models/orders_filter.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar(
      {super.key, required this.controller, required this.searchCategory, required this.searchCtrl});
  final PagingController<int, Object> controller;
  final SearchCategory searchCategory;
  final TextEditingController searchCtrl;
  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2 + 16);
}

class _SearchAppBarState extends State<SearchAppBar> {
  late SearchCategory searchCategory;
  SortOptions sortOptions = SortOptions.dateRecent;
  ProductFilter? productFilter;
  OrderFilter? orderFilter;
  @override
  void initState() {
    widget.controller.addPageRequestListener(_search);
    searchCategory = widget.searchCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;

    bool showFilterBy = searchCategory == SearchCategory.orders ||
        searchCategory == SearchCategory.products;

    IconData sortIcon = switch (sortOptions) {
      SortOptions.aZ => Icons.sort_by_alpha,
      SortOptions.zA => Icons.sort_by_alpha,
      SortOptions.dateRecent => CupertinoIcons.calendar_badge_plus,
      SortOptions.dateOld => CupertinoIcons.calendar_badge_minus,
    };

    int orderFilterCount = orderFilter?.count() ?? 0;
    int productFilterCount = productFilter?.count() ?? 0;
    Color filterBorderColor =
        (searchCategory == SearchCategory.orders && orderFilterCount > 0) ||
                (searchCategory == SearchCategory.products &&
                    productFilterCount > 0)
            ? ColorManager.primary
            : Colors.transparent;
    final useMaterial3 = PreferenceService.appSettingsGetter.useMaterial3;
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: context.topViewPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (useMaterial3)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SearchBar(
                  controller: widget.searchCtrl,
                  onSubmitted: (val) async {
                    if (val.removeAllWhitespace.isNotEmpty) {
                      _search(0);
                      await PreferenceService.instance.updateSearchHistory(
                          SearchHistory(
                              text: val, searchableFields: searchCategory));
                    }
                  },
                  hintText: getHintText(searchCategory),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  leading: IconButton(
                    padding: const EdgeInsets.all(16),
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.popRoute();
                    },
                  ),
                  trailing: [
                    IconButton(
                        padding: const EdgeInsets.all(16),
                        onPressed: () {
                          widget.searchCtrl.clear();
                          widget.controller.itemList?.clear();
                        },
                        icon: const Icon(Icons.clear))
                  ],
                ),
              ),
            if (!useMaterial3)
              Row(
                children: [
                  const BackButton(),
                  Flexible(
                    child: SearchTextField(
                      controller: widget.searchCtrl,
                      onSubmitted: (val) async {
                        if (val.removeAllWhitespace.isNotEmpty) {
                          widget.controller.refresh();
                          await PreferenceService.instance.updateSearchHistory(
                              SearchHistory(
                                  text: val, searchableFields: searchCategory));
                        }
                      },
                      hintText: getHintText(searchCategory),
                      autoFocus: true,
                      onSuffixTap: () {
                        widget.searchCtrl.clear();
                        widget.controller.itemList?.clear();
                      },
                    ),
                  ),
                  const SizedBox(width: 12.0)
                ],
              ),
            Column(
              children: [
                Container(
                  height: kToolbarHeight,
                  alignment: Alignment.bottomCenter,
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
                              style: smallTextStyle?.copyWith(color: manatee),
                            ),
                            SearchChip(
                              searchableField: searchCategory,
                              onTap: () async {
                                await showBarModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) {
                                      return PickSearchCategory(
                                          selectedSearchCategory:
                                              searchCategory);
                                    }).then((result) {
                                  if (result is SearchCategory) {
                                    // Groups can only be sorted to date NOT to name
                                    if (result == SearchCategory.groups) {
                                      sortOptions = SortOptions.dateRecent;
                                    }
                                    orderFilter = null;
                                    productFilter = null;
                                    widget.controller.itemList = [];
                                    searchCategory = result;
                                    setState(() {});
                                    // if (controller.searchTerm.isNotEmpty) {
                                    //   controller.pagingController.refresh();
                                    // }
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
                                style: smallTextStyle?.copyWith(color: manatee),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(4.0),
                                onTap: () async {
                                  final isGroupSelected =
                                      searchCategory == SearchCategory.groups;
                                  final result = await selectSortOptions(
                                      context, sortOptions,
                                      disableAZ: isGroupSelected,
                                      disableZA: isGroupSelected);
                                  if (result is SortOptions) {
                                    sortOptions = result;
                                    widget.controller.refresh();
                                    setState(() {});
                                  }
                                },
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      color: context
                                          .theme.appBarTheme.backgroundColor,
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
                                style: smallTextStyle?.copyWith(color: manatee),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(4.0),
                                onLongPress: () {
                                  if (searchCategory ==
                                      SearchCategory.products) {
                                    productFilter = null;
                                  } else if (searchCategory ==
                                      SearchCategory.orders) {
                                    orderFilter = null;
                                  }
                                  setState(() {});
                                },
                                onTap: () async {
                                  switch (searchCategory) {
                                    case SearchCategory.products:
                                      await showBarModalBottomSheet<
                                              ProductFilter>(
                                          context: context,
                                          backgroundColor: context
                                              .theme.scaffoldBackgroundColor,
                                          enableDrag: false,
                                          overlayStyle: context.theme
                                              .appBarTheme.systemOverlayStyle,
                                          builder: (context) =>
                                              ProductsFilterView(
                                                onResetPressed: () {
                                                  productFilter = null;
                                                  widget.controller.refresh();
                                                  setState(() {});
                                                  context.popRoute();
                                                },
                                                productFilter: productFilter,
                                              )).then((result) {
                                        if (result is ProductFilter) {
                                          productFilter = result;
                                          setState(() {});
                                          widget.controller.refresh();
                                        }
                                      });

                                    case SearchCategory.orders:
                                      await showBarModalBottomSheet<
                                              OrderFilter>(
                                          context: context,
                                          backgroundColor: context
                                              .theme.scaffoldBackgroundColor,
                                          enableDrag: false,
                                          overlayStyle: context.theme
                                              .appBarTheme.systemOverlayStyle,
                                          builder: (context) =>
                                              OrdersFilterView(
                                                orderFilter: orderFilter,
                                                onResetTap: () {
                                                  orderFilter = null;
                                                  setState(() {});
                                                  widget. controller.refresh();
                                                  context.popRoute();
                                                },
                                              )).then((result) {
                                        if (result is OrderFilter) {
                                          orderFilter = result;
                                          setState(() {});
                                          widget. controller.refresh();
                                        }
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
                                      color: context
                                          .theme.appBarTheme.backgroundColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0)),
                                      border:
                                          Border.all(color: filterBorderColor)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 8.0),
                                      Text('Filters ', style: smallTextStyle),
                                      if (productFilterCount != 0 &&
                                          searchCategory ==
                                              SearchCategory.products)
                                        Text(productFilterCount.toString(),
                                            style: smallTextStyle),
                                      if (orderFilterCount != 0 &&
                                          searchCategory ==
                                              SearchCategory.orders)
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
                const Divider(height: 0),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool get showOrderBy => switch (searchCategory) {
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
        return 'Search for price lists\' description, name, and customer group\'s name';
    }
  }

  void _search(int _) {
    Map<String, dynamic> queryParameters = {
      'offset': widget.controller.itemList?.length ?? 0,
      'limit': SearchBloc.pageSize,
      'q': widget.searchCtrl.text,
    };

    switch (searchCategory) {
      // -----------------------------------------------------------
      case SearchCategory.orders:
        queryParameters.addAll({
          'expand':
              'items,cart,customer,shipping_address,sales_channel,currency',
          'fields':
              'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
        });
        if (orderFilter != null) {
          queryParameters.addAll(orderFilter!.toJson());
        }
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchOrders(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.draftOrders:
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchDrafts(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.products:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
        if (productFilter != null) {
          queryParameters.addAll(productFilter!.toJson());
        }
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchProducts(queryParameters: queryParameters));

      // -----------------------------------------------------------
      case SearchCategory.collections:
        context.read<SearchBloc>().add(
            SearchEvent.searchCollections(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.customers:
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchCustomers(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.groups:
        if (sortOptions == SortOptions.dateRecent ||
            sortOptions == SortOptions.dateOld) {
          queryParameters.addAll({
            'order': sortOptions.map(),
          });
        }
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchGroups(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.giftCards:
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchGiftCards(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.discounts:
        context
            .read<SearchBloc>()
            .add(SearchEvent.searchDiscounts(queryParameters: queryParameters));
      // -----------------------------------------------------------
      case SearchCategory.priceLists:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
        context.read<SearchBloc>().add(
            SearchEvent.searchPriceLists(queryParameters: queryParameters));
    }
  }
}
