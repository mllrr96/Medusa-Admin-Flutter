import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/base_products.dart';
import '../../../../core/utils/strings.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/req/store_post_search_req.dart';
import '../../models/res/products.dart';

class ProductsRepo extends BaseProducts {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: AppConstants.baseUrl);

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future<Either<UserProductsListRes, Failure>> list(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/products',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return left(UserProductsListRes.fromJson(response.data));
      } else {
        return right(Failure(error: response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return right(Failure(error: error));
    }
  }

  /// @description Retrieves a single Product
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsRes>}
  Future<UserProductsRes?> retrieve(String id,
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/products/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return UserProductsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a single Product
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsRes>}
  Future<UserVariantsRes?> retrieveVariants(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/variants', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return UserVariantsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Searches for products
  /// @param {StorePostSearchReq} searchOptions is required
  /// @param customHeaders
  /// @return {ResponsePromise<StorePostSearchRes>}
  Future<UserPostSearchRes?> search({StorePostSearchReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/products/search', data: req);
      if (response.statusCode == 200) {
        return UserPostSearchRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Either<Product, Failure>> add(
      {required UserPostProductReq userPostProductReq, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(uri: '/products', data: userPostProductReq.toJson());
      if (response.statusCode == 200) {
        return Left(Product.fromJson(response.data['product']));
      } else {
        debugPrint(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  Future<Either<UserDeleteProductRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete('/products/$id');
      if (response.statusCode == 200) {
        return Left(UserDeleteProductRes.fromJson(response.data));
      } else {
        debugPrint(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  Future<Either<UserUpdateProductRes, Failure>> update(
      {required Product product, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    String id = product.id!;
    try {
      final response = await _dataProvider.post(uri: '/products/$id', data: product.copyWith(id: null).toJson());
      if (response.statusCode == 200) {
        return Left(UserUpdateProductRes.fromJson(response.data));
      } else {
        debugPrint(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }
}
