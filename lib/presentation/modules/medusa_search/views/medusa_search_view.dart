import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/modules/collections_module/collections/components/collection_list_tile.dart';
import 'package:medusa_admin/presentation/modules/customers_module/customers/components/customer_list_tile.dart';
import 'package:medusa_admin/presentation/modules/discount_module/discounts/components/discount_card.dart';
import 'package:medusa_admin/presentation/modules/draft_orders_module/draft_orders/components/index.dart';
import 'package:medusa_admin/presentation/modules/groups_module/groups/components/group_card.dart';
import 'package:medusa_admin/presentation/modules/products_module/products/components/index.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/domain/use_case/search/search_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../core/utils/enums.dart';
import '../../../views/orders/components/order_card.dart';
import '../components/index.dart';
import '../controllers/medusa_search_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class MedusaSearchView extends StatelessWidget {
  const MedusaSearchView({super.key, required this.searchCategory});
  final SearchCategory searchCategory;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: GetBuilder<MedusaSearchController>(
        init: MedusaSearchController(
          searchUseCase: SearchUseCase.instance,
          searchCategory: searchCategory,
        ),
        builder: (controller) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.systemUiOverlayNoAppBarStyle,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: SearchAppBar(controller: controller),
              body: PagedListView.separated(
                pagingController: controller.pagingController,
                separatorBuilder: (context, index) {
                  switch (controller.searchCategory) {
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
                      switch (controller.searchCategory) {
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
                            pagingController: controller.pagingController),
                    noItemsFoundIndicatorBuilder: (context) =>
                        SearchHistoryView(controller: controller)),
              ),
            ),
          );
        },
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
  const SearchHistoryView({super.key, required this.controller});
  final MedusaSearchController controller;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final searchHistory = PreferenceService.searchHistory;
    if (controller.searchTerm.removeAllWhitespace.isEmpty &&
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
                      onTap: () {
                        // controller.searchCategory = e.searchableFields;
                        controller.searchCtrl.text = e.text;
                        controller.searchTerm = e.text;
                        controller.update();
                        controller.pagingController.refresh();
                      },
                      onDeleteTap: () async {
                        await PreferenceService.instance
                            .updateSearchHistory(e, delete: true);
                        controller.update();
                      },
                    ))
                .toList()
                .reversed,
          ],
        ),
      );
    } else if (controller.searchTerm.removeAllWhitespace.isEmpty &&
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
