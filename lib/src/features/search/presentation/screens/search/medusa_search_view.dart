import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/app_settings/data/service/preference_service.dart';
import 'package:medusa_admin/src/features/discounts/presentation/screens/discounts/components/discount_card.dart';
import 'package:medusa_admin/src/features/draft_orders/presentation/screens/draft_orders/components/draft_order_card.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/orders/components/order_card.dart';
import 'package:medusa_admin/src/features/search/data/models/search_history.dart';
import 'package:medusa_admin/src/features/search/presentation/bloc/search/search_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import '../../../../collections/presentation/screens/collections/components/index.dart';
import '../../../../customers/presentation/screens/customers/components/index.dart';
import '../../../../groups/presentation/screens/groups/components/index.dart';
import '../../../../products/presentation/screens/products/components/product_list_tile.dart';
import 'components/index.dart';

@RoutePage()
class MedusaSearchView extends StatefulWidget {
  const MedusaSearchView({super.key, required this.searchCategory});

  final SearchCategory searchCategory;

  @override
  State<MedusaSearchView> createState() => _MedusaSearchViewState();
}

class _MedusaSearchViewState extends State<MedusaSearchView> {
  late SearchCategory searchCategory;
  TextEditingController searchCtrl = TextEditingController();
  final PagingController<int, Object> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);

  @override
  void initState() {
    searchCategory = widget.searchCategory;
    super.initState();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        state.mapOrNull(
            loaded: (r) {
              final isLastPage = r.items.length < SearchBloc.pageSize;
              if (isLastPage) {
                pagingController.appendLastPage(r.items);
              } else {
                final nextPageKey =
                    pagingController.nextPageKey ?? 1 + r.items.length;
                pagingController.appendPage(r.items, nextPageKey);
              }
            },
            error: (e) => pagingController.error = e.failure);
      },
      child: HideKeyboard(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: context.systemUiOverlayNoAppBarStyle,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: SearchAppBar(
              controller: pagingController,
              searchCategory: widget.searchCategory,
              searchCtrl: searchCtrl,
            ),
            body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.maybeWhen(
                  initial: () => SearchHistoryView(searchCtrl),
                  orElse: () => PagedListView.separated(
                    pagingController: pagingController,
                    separatorBuilder: (context, index) {
                      switch (searchCategory) {
                        case SearchCategory.orders:
                          return const Gap(8.0);
                        case SearchCategory.draftOrders:
                          return const Gap(12.0);
                        case SearchCategory.products:
                          return const Divider(height: 0, indent: 16);
                        case SearchCategory.collections:
                        case SearchCategory.customers:
                          return const SizedBox.shrink();
                        case SearchCategory.groups:
                          return Divider(
                              height: 0, indent: Platform.isIOS ? 16.0 : 0);
                        case SearchCategory.giftCards:
                          return const Divider(height: 0);
                        case SearchCategory.discounts:
                          return const Gap(12.0);
                        case SearchCategory.priceLists:
                          return const Divider(height: 0, indent: 16.0);
                      }
                    },
                    builderDelegate: PagedChildBuilderDelegate<Object>(
                        animateTransitions: true,
                        itemBuilder: (context, object, index) {
                          switch (searchCategory) {
                            case SearchCategory.orders:
                              if (object is Order) {
                                return AlternativeOrderCard(object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.draftOrders:
                              if (object is DraftOrder) {
                                return DraftOrderCard(object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.products:
                              if (object is Product) {
                                return ProductListTile(product: object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.collections:
                              if (object is ProductCollection) {
                                return CollectionListTile(object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.customers:
                              if (object is Customer) {
                                return CustomerListTile(object, index: index);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.groups:
                              if (object is CustomerGroup) {
                                return GroupCard(
                                  customerGroup: object,
                                  index: index,
                                );
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.giftCards:
                              if (object is GiftCard) {
                                return ListTile(
                                  title: Text(object.code),
                                );
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.discounts:
                              if (object is Promotion) {
                                return DiscountCard(object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.priceLists:
                              if (object is PriceList) {
                                return ListTile(
                                  title: Text(object.title),
                                  subtitle: Text(object.description,
                                      style: smallTextStyle?.copyWith(
                                          color: manatee)),
                                );
                              } else {
                                return const SizedBox();
                              }
                          }
                        },
                        firstPageProgressIndicatorBuilder: (context) =>
                            const Center(
                                child: CircularProgressIndicator.adaptive()),
                        firstPageErrorIndicatorBuilder: (context) =>
                            PaginationErrorPage(
                                pagingController: pagingController),
                        noItemsFoundIndicatorBuilder: (context) =>
                            SearchHistoryView(
                              searchCtrl,
                              onTap: (searchHistory) {
                                searchCategory = searchHistory.searchableFields;
                                searchCtrl.text = searchHistory.text;
                                setState(() {});
                                pagingController.refresh();
                              },
                            )),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchHistoryListTile extends StatelessWidget {
  const SearchHistoryListTile({
    super.key,
    required this.searchHistory,
    this.onTap,
    this.onDeleteTap,
  });

  final SearchHistory searchHistory;
  final void Function()? onTap;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;

    return ListTile(
      dense: true,
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: 16.0),
      leading: SearchChip(searchableField: searchHistory.searchableFields),
      title: Text(searchHistory.text, style: smallTextStyle),
      trailing: IconButton(
        icon: const Icon(CupertinoIcons.xmark_circle_fill, size: 20),
        onPressed: onDeleteTap,
      ),
    );
  }
}

class SearchHistoryView extends StatelessWidget {
  const SearchHistoryView(this.searchCtrl, {super.key, this.onTap});

  final TextEditingController searchCtrl;
  final void Function(SearchHistory)? onTap;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final searchHistory = PreferenceService.searchHistory;
    if (searchCtrl.text.removeAllWhitespace.isEmpty &&
        searchHistory.isNotEmpty) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Text(
                'Search history',
                style: smallTextStyle?.copyWith(color: manatee),
              ),
            ),
            ...searchHistory
                .map((e) => SearchHistoryListTile(
                      searchHistory: e,
                      onTap: () => onTap?.call(e),
                      onDeleteTap: () async {
                        await PreferenceService.instance
                            .updateSearchHistory(e, delete: true);
                        // controller.update();
                      },
                    ))
                .toList()
                .reversed,
          ],
        ),
      );
    } else if (searchCtrl.text.removeAllWhitespace.isEmpty &&
        searchHistory.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MedusaIcons.magnifying_glass),
                Text('Search in your store'),
              ],
            ),
          )
        ],
      );
    }

    return const Center(
      child: Text('No items found'),
    );
  }
}
