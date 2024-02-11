import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/search_history.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/blocs/search/search_bloc.dart';
import 'package:medusa_admin/presentation/views/collections/components/collection_list_tile.dart';
import 'package:medusa_admin/presentation/views/customers/components/index.dart';
import 'package:medusa_admin/presentation/views/discounts/components/discount_card.dart';
import 'package:medusa_admin/presentation/views/draft_orders/components/index.dart';
import 'package:medusa_admin/presentation/views/groups/components/index.dart';
import 'package:medusa_admin/presentation/views/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/views/products/components/index.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'components/index.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

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
            loaded: (_) {
              final isLastPage = _.items.length < SearchBloc.pageSize;
              if (isLastPage) {
                pagingController.appendLastPage(_.items);
              } else {
                final nextPageKey =
                    pagingController.nextPageKey ?? 1 + _.items.length;
                pagingController.appendPage(_.items, nextPageKey);
              }
            },
            error: (_) => pagingController.error = _.failure);
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
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
                return state.maybeMap(
                  initial: (_) => SearchHistoryView(searchCtrl),
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
                              height: 0, indent: GetPlatform.isIOS ? 16.0 : 0);
                        case SearchCategory.giftCards:
                          return const Divider(height: 0);
                        case SearchCategory.discounts:
                          return const Gap(12.0);
                        case SearchCategory.priceLists:
                          return const Divider(height: 0, indent: 16.0);
                      }
                    },
                    builderDelegate: PagedChildBuilderDelegate<Object>(
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
                                  title: Text(object.code ?? ''),
                                );
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.discounts:
                              if (object is Discount) {
                                return DiscountCard(object);
                              } else {
                                return const SizedBox();
                              }
                            case SearchCategory.priceLists:
                              if (object is PriceList) {
                                return ListTile(
                                  title: Text(object.name ?? ''),
                                  subtitle: Text(object.description ?? '',
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
