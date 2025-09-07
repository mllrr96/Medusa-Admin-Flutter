import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
@lazySingleton
class SearchUseCase {
  final MedusaAdminV2 _medusaAdmin;
  SearchUseCase(this._medusaAdmin);
  ProductsRepository get _productsRepository => _medusaAdmin.products;
  OrdersRepository get _ordersRepository => _medusaAdmin.orders;
  DraftOrdersRepository get _draftOrderRepository => _medusaAdmin.draftOrders;
  CollectionsRepository get _collectionRepository =>  _medusaAdmin.collections;
  CustomersRepository get _customerRepository =>  _medusaAdmin.customers;
  CustomerGroupsRepository get _customerGroupRepository =>  _medusaAdmin.customerGroups;
  GiftCardsRepository get _giftCardRepository =>  _medusaAdmin.giftCards;
  PromotionsRepository get _discountRepository =>  _medusaAdmin.promotions;
  PriceListsRepository get _priceListRepository =>  _medusaAdmin.priceLists;
  ProductTagsRepository get _tagRepository =>  _medusaAdmin.productTags;
  RegionsRepository get _regionsRepository =>  _medusaAdmin.regions;
  SalesChannelsRepository get _salesChannelRepository =>  _medusaAdmin.salesChannels;

  static SearchUseCase get instance => getIt<SearchUseCase>();

  Future<Result<SalesChannelListRes, MedusaError>> fetchSalesChannels({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductTagListResponse, MedusaError>> fetchTags({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _tagRepository.list(
          query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductsRes, MedusaError>> fetchProducts({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<GiftCardsListResponse, MedusaError>> fetchGiftCards({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _giftCardRepository.retrieveAll(
           queryParameters ?? {});
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CustomerGroupsListRes, MedusaError>> fetchCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.list(
          queryParameters: queryParameters);
      return Success(result);
    }on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PriceListsListRes, MedusaError>> fetchPriceLists({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _priceListRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<RegionsRes, MedusaError>> fetchRegions(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CustomersListRes, MedusaError>> fetchCustomers(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerRepository.list(
          query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<OrdersListRes, MedusaError>> fetchOrders(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _ordersRepository.list(
          queryParameters: queryParameters);
      return Success(result);
    }on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CollectionListRes, MedusaError>> fetchCollections({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<PromotionsListResponse, MedusaError>> fetchDiscounts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.list(
        queryParameters: queryParameters,
      );
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<DraftOrderListResponse, MedusaError>> fetchDraftOrders({
    GetDraftOrdersQuery? queryParameters,
  }) async {
    try {
      final result = await _draftOrderRepository.getDraftOrders(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
