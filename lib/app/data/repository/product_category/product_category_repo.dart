import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_product_category.dart';
import 'package:medusa_admin/app/data/models/res/product_category.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_product_category.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class ProductCategoryRepo extends BaseProductCategory {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserAddProductsToCategoryRes, Failure>> addProductsToCategory({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/product-categories/$id/products/batch',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserAddProductsToCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserCreateProductCategoryRes, Failure>> createProductCategory({
    required UserCreateProductCategoryReq userCreateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/product-categories',
        data: userCreateProductCategoryReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateProductCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteProductCategoryRes, Failure>> deleteProductCategory({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/product-categories/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteProductCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteProductsToCategoryRes, Failure>> deleteProductsFromCategory({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/product-categories/$id/products/batch',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteProductsToCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveProductCategoriesRes, Failure>> retrieveProductCategories({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/product-categories',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveProductCategoriesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveProductCategoryRes, Failure>> retrieveProductCategory({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/product-categories/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveProductCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserUpdateProductCategoryRes, Failure>> updateProductCategory({
    required String id,
    required UserUpdateProductCategoryReq userUpdateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/product-categories/$id',
        data: userUpdateProductCategoryReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateProductCategoryRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
