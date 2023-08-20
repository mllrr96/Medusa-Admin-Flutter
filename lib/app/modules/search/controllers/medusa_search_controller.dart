import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/core/utils/enums.dart';

import '../../../data/repository/collection/collection_repo.dart';
import '../../../data/repository/customer/customer_repo.dart';
import '../../../data/repository/discount/discount_repo.dart';
import '../../../data/repository/draft_order/draft_order_repo.dart';
import '../../../data/repository/gift_card/gift_card_repo.dart';
import '../../../data/repository/order/orders_repo.dart';

class MedusaSearchController extends GetxController {
  static MedusaSearchController get instance =>
      Get.find<MedusaSearchController>();
  MedusaSearchController({
    required this.productsRepo,
    required this.ordersRepo,
    required this.draftOrderRepo,
    required this.collectionRepo,
    required this.customerRepo,
    required this.customerGroupRepo,
    required this.giftCardRepo,
    required this.discountRepo,
    required this.priceListRepo,
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

  final PagingController<int, Object> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  SortOptions sortOptions = SortOptions.dateRecent;
  TextEditingController searchCtrl = TextEditingController();
  String searchTerm = '';
  SearchCategory searchCategory = SearchCategory.products;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchPage(int pageKey) async {
    if (searchTerm.removeAllWhitespace.isEmpty) {
      pagingController.itemList = [];
      return;
    }
    var queryParameters = {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'q': searchTerm,
    };

    switch (searchCategory) {
      case SearchCategory.orders:
        queryParameters.addAll({
          'expand':
              'items,cart,customer,shipping_address,sales_channel,currency',
          'fields':
              'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
      case SearchCategory.products:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
      case SearchCategory.customers:
        queryParameters.addAll({
          'order': sortOptions.map(),
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          print(error.toString());
          pagingController.error = 'Error searching, ${error.toString()}';
        });
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
          pagingController.error = 'Error searching, ${error.toString()}';
        });
    }
  }
}

class SearchReq {
  SearchCategory searchableFields;

  SearchReq({
    required this.searchableFields,
  });
}

enum SearchCategory {
  orders,
  draftOrders,
  products,
  collections,
  customers,
  groups,
  giftCards,
  discounts,
  priceLists;

  factory SearchCategory.fromJson(int? val) {
    switch (val) {
      case null:
        return SearchCategory.orders;
      case 0:
        return SearchCategory.orders;
      case 1:
        return SearchCategory.draftOrders;
      case 2:
        return SearchCategory.products;
      case 3:
        return SearchCategory.collections;
      case 4:
        return SearchCategory.customers;
      case 5:
        return SearchCategory.groups;
      case 6:
        return SearchCategory.giftCards;
      case 7:
        return SearchCategory.discounts;
      case 8:
        return SearchCategory.priceLists;

      default:
        return SearchCategory.orders;
    }
  }
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
