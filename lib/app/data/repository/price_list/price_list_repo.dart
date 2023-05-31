import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_price_list_req.dart';
import 'package:medusa_admin/app/data/models/res/price_list.dart';
import 'package:medusa_admin/app/data/repository/price_list/base_price_list.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class PriceListRepo extends BasePriceList {
  final _dataProvider = DioClient(dio: Dio());

  /// Creates a Price List
  @override
  Future<Result<UserPriceListRes, Failure>> createPriceList({
    required UserCreatePriceListReq userCreatePriceListReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/price-lists',
        data: userCreatePriceListReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Price List
  @override
  Future<Result<UserDeletePriceListRes, Failure>> deletePriceList({
    /// The ID of the Price List to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/price-lists/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeletePriceListRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Batch delete prices that belong to a Price List
  @override
  Future<Result<UserDeletePricesRes, Failure>> deletePrices({
    /// The ID of the Price List that the Money Amounts (Prices) that will be deleted belongs to.
    required String id,

    /// The price id's of the Money Amounts to delete.
    required List<String> priceIds,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/price-lists/$id/prices/batch',
        data: {
          'price_ids': priceIds,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserDeletePricesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Delete all the prices related to a specific product in a price list
  @override
  Future<Result<UserDeleteProductPricesRes, Failure>> deleteProductPrices({
    /// The ID of the Price List that the Money Amounts that will be deleted belongs to.
    required String id,

    /// The ID of the product from which the money amount will be deleted.
    required String productId,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/price-lists/$id/products/$productId/prices',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteProductPricesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Delete all the prices related to a specific variant in a price list
  @override
  Future<Result<UserDeleteVariantPricesRes, Failure>> deleteVariantPrices({
    /// The ID of the Price List that the Money Amounts that will be deleted belongs to.
    required String id,

    /// The ID of the variant from which the money amount will be deleted.
    required String variantId,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/price-lists/$id/variants/$variantId/prices',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteVariantPricesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Price List.
  @override
  Future<Result<UserPriceListRes, Failure>> retrievePriceList({
    /// The ID of the Price List.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/price-lists/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Product that are part of a Price List
  @override
  Future<Result<UserPriceListsProductsRes, Failure>> retrievePriceListProducts({
    /// ID of the price list.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/price-lists/$id/products',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListsProductsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Price Lists.
  @override
  Future<Result<UserPriceListsRes, Failure>> retrievePriceLists({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/price-lists',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Price List
  @override
  Future<Result<UserPriceListRes, Failure>> updatePriceList({
    /// The ID of the Price List.
    required String id,
    required UserUpdatePriceListReq userUpdatePriceListReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/price-lists',
        data: userUpdatePriceListReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Price List
  @override
  Future<Result<UserPriceListRes, Failure>> updatePrices({
    /// The ID of the Price List to update prices for.
    required String id,
    required UserUpdatePricesReq userUpdatePricesReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/price-lists/$id/prices/batch',
        data: userUpdatePricesReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserPriceListRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
