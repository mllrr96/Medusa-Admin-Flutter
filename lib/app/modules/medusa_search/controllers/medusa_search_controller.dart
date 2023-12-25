import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:medusa_admin/app/modules/products_module/products/components/index.dart';
import 'package:medusa_admin/core/utils/enums.dart';

import '../../../data/repository/collection/collection_repo.dart';
import '../../../data/repository/customer/customer_repo.dart';
import '../../../data/repository/discount/discount_repo.dart';
import '../../../data/repository/draft_order/draft_order_repo.dart';
import '../../../data/repository/gift_card/gift_card_repo.dart';
import '../../../data/repository/order/orders_repo.dart';
import '../../../data/repository/product_tag/product_tag_repo.dart';
import '../../../data/repository/sales_channel/sales_channel_repo.dart';

class MedusaSearchController extends GetxController {
  static MedusaSearchController get instance =>
      Get.find<MedusaSearchController>();
  MedusaSearchController( {
    required this.productsRepo,
    required this.ordersRepo,
    required this.draftOrderRepo,
    required this.collectionRepo,
    required this.customerRepo,
    required this.customerGroupRepo,
    required this.giftCardRepo,
    required this.discountRepo,
    required this.priceListRepo,
    required this.productTagRepo,
    required this.regionsRepo,
    required this.salesChannelRepo,
    required this.searchCategory,
  });

  final ProductsRepo productsRepo;
  final OrdersRepo ordersRepo;
  final DraftOrderRepo draftOrderRepo;
  final CollectionRepo collectionRepo;
  final CustomerRepo customerRepo;
  final CustomerGroupRepo customerGroupRepo;
  final GiftCardRepo giftCardRepo;
  final DiscountRepo discountRepo;
  final PriceListRepo priceListRepo;
  final ProductTagRepo productTagRepo;
  final RegionsRepo regionsRepo;
  final SalesChannelRepo salesChannelRepo;
  SearchCategory searchCategory;
  final PagingController<int, Object> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;

  SortOptions sortOptions = SortOptions.dateRecent;
  ProductFilter? productFilter;
  OrderFilter? orderFilter;
  List<ProductCollection>? collections;
  List<ProductTag>? tags;
  List<Region>? regions;
  List<SalesChannel>? salesChannels;
  TextEditingController searchCtrl = TextEditingController();
  String searchTerm = '';
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchPage(int pageKey) async {
    if (searchTerm.removeAllWhitespace.isEmpty) {
      pagingController.itemList = [];
      return;
    }
    Map<String, dynamic> queryParameters = {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'q': searchTerm,
    };

    switch (searchCategory) {
      // -----------------------------------------------------------
      case SearchCategory.orders :
        queryParameters.addAll({
          'expand':
              'items,cart,customer,shipping_address,sales_channel,currency',
          'fields':
              'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
        });
        if (orderFilter != null) {
          queryParameters.addAll(orderFilter!.toJson());
        }
        final result =
            await ordersRepo.retrieveOrders(queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.orders!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.orders!);
          } else {
            final nextPageKey = pageKey + success.orders!.length;
            pagingController.appendPage(success.orders!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.draftOrders:
        final result = await draftOrderRepo.retrieveDraftOrders(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.draftOrders!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.draftOrders!);
          } else {
            final nextPageKey = pageKey + success.draftOrders!.length;
            pagingController.appendPage(success.draftOrders!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.products:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
        if (productFilter != null) {
          queryParameters.addAll(productFilter!.toJson());
        }
        final result =
            await productsRepo.retrieveAll(queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.products!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.products!);
          } else {
            final nextPageKey = pageKey + success.products!.length;
            pagingController.appendPage(success.products!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.collections:
        final result =
            await collectionRepo.retrieveAll(queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.collections!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.collections!);
          } else {
            final nextPageKey = pageKey + success.collections!.length;
            pagingController.appendPage(success.collections!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.customers:
        final result = await customerRepo.retrieveCustomers(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.customers!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.customers!);
          } else {
            final nextPageKey = pageKey + success.customers!.length;
            pagingController.appendPage(success.customers!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.groups:
        if (sortOptions == SortOptions.dateRecent ||
            sortOptions == SortOptions.dateOld) {
          queryParameters.addAll({
            'order': sortOptions.map(),
          });
        }
        final result = await customerGroupRepo.retrieveCustomerGroups(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.customerGroups!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.customerGroups!);
          } else {
            final nextPageKey = pageKey + success.customerGroups!.length;
            pagingController.appendPage(success.customerGroups!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.giftCards:
        final result = await giftCardRepo.retrieveGiftCards(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.giftCards!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.giftCards!);
          } else {
            final nextPageKey = pageKey + success.giftCards!.length;
            pagingController.appendPage(success.giftCards!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.discounts:
        final result = await discountRepo.retrieveDiscounts(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.discounts!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.discounts!);
          } else {
            final nextPageKey = pageKey + success.discounts!.length;
            pagingController.appendPage(success.discounts!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
      // -----------------------------------------------------------
      case SearchCategory.priceLists:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
        final result = await priceListRepo.retrievePriceLists(
            queryParameters: queryParameters);
        result.when((success) {
          final isLastPage = success.priceLists!.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(success.priceLists!);
          } else {
            final nextPageKey = pageKey + success.priceLists!.length;
            pagingController.appendPage(success.priceLists!, nextPageKey);
          }
        }, (error) {
          pagingController.error = error;
        });
    }
  }
}

class SearchReq {
  final SearchCategory searchCategory;
  SearchReq({
    required this.searchCategory,
  });
}


class SearchHistory {
  final String text;
  final SearchCategory searchableFields;

  SearchHistory({required this.text, required this.searchableFields});

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
        text: json['text'],
        searchableFields: SearchCategory.fromJson(json['searchableField']));
  }

  static Map<String, dynamic> toJson(SearchHistory searchHistory) {
    return {
      'text': searchHistory.text,
      'searchableField': searchHistory.searchableFields.index,
    };
  }

  static String encode(List<SearchHistory> searchHistoryList) => json.encode(
        searchHistoryList
            .map<Map<String, dynamic>>(
                (searchHistory) => SearchHistory.toJson(searchHistory))
            .toList(),
      );
  static List<SearchHistory> decode(String searchHistoryList) =>
      (json.decode(searchHistoryList) as List<dynamic>)
          .map<SearchHistory>(
              (searchHistory) => SearchHistory.fromJson(searchHistory))
          .toList();
}
