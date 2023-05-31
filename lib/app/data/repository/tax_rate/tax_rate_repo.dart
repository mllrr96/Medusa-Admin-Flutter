import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/dio/dio_client.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_tax_rate.dart';
import 'package:medusa_admin/app/data/models/res/tax_rate.dart';
import 'package:medusa_admin/app/data/repository/tax_rate/base_tax_rate.dart';
import 'package:multiple_result/multiple_result.dart';

class TaxRateRepo extends BaseTaxRate {
  final _dataProvider = DioClient(dio: Dio());

  /// Associates a Tax Rate with a list of Products
  @override
  Future<Result<UserTaxRateRes, Failure>> addTaxRateToProducts({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the products to associate with this tax rate
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/tax-rates/$id/products/batch',
        data: {'products': productIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Associates a Tax Rate with a list of Product Types
  @override
  Future<Result<UserTaxRateRes, Failure>> addTaxRateToProductType({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the types of products to associate with this tax rate
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/tax-rates/$id/products/batch',
        data: {'product_types': productTypeIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Associates a Tax Rate with a list of Shipping Options
  @override
  Future<Result<UserTaxRateRes, Failure>> addTaxRateToShippingOptions({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the shipping options to associate with this tax rate.
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/tax-rates/$id/products/batch',
        data: {'shipping_options': shippingOptionIds},
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Tax Rate
  @override
  Future<Result<UserTaxRateRes, Failure>> createTaxRate({
    required UserCreateTaxRateReq userCreateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/tax-rates',
        data: userCreateTaxRateReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Tax Rate
  @override
  Future<Result<UserDeleteTaxRateRes, Failure>> deleteTaxRate({
    /// The ID of the Tax Rate to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/tax-rates/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Removes a Tax Rate from a list of Products
  @override
  Future<Result<UserTaxRateRes, Failure>> removeTaxRateFromProduct({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the products to remove association with this tax rate
    required List<String> productIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/tax-rates/$id/products/batch',
        data: {'products': productIds},
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Removes a Tax Rate from a list of Product Types
  @override
  Future<Result<UserTaxRateRes, Failure>> removeTaxRateToProductType({
    /// ID of the tax rate.
    required String id,

    /// The IDs of the types of products to remove association with this tax rate
    required List<String> productTypeIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/tax-rates/$id/product-types/batch',
        data: {'product-types': productTypeIds},
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Removes a Tax Rate from a list of Shipping Options
  @override
  Future<Result<UserTaxRateRes, Failure>> removeTaxRateToShippingOption({
    required String id,
    required List<String> shippingOptionIds,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/tax-rates/$id/shipping_options/batch',
        data: {'shipping_options': shippingOptionIds},
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a TaxRate
  @override
  Future<Result<UserTaxRateRes, Failure>> retrieveTaxRate({
    /// ID of the tax rate.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/tax-rates/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of TaxRates
  @override
  Future<Result<UserRetrieveTaxRatesRes, Failure>> retrieveTaxRates({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/tax-rates',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveTaxRatesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Tax Rate
  @override
  Future<Result<UserTaxRateRes, Failure>> updateTaxRate({
    /// ID of the tax rate.
    required String id,
    required UserUpdateTaxRateReq userUpdateTaxRateReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/tax-rates',
        data: userUpdateTaxRateReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserTaxRateRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
