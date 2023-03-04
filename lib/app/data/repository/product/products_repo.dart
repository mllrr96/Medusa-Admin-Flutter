import 'dart:developer';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/base_products.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/req/store_post_search_req.dart';
import '../../models/res/products.dart';
import '../../service/storage_service.dart';

class ProductsRepo extends BaseProducts {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  /// Retrieves a list of products
  @override
  Future<Result<UserProductsListRes, Failure>> retrieveAll(
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
        return Success(UserProductsListRes.fromJson(response.data));
      } else {
        return Error(Failure(error: response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure(error: error));
    }
  }

  /// Retrieves a single Product
  @override
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

  /// Retrieves a single Product
  @override
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

  /// Searches for products
  @override
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

  @override
  Future<Result<Product, Failure>> add(
      {required UserPostProductReq userPostProductReq, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(uri: '/products', data: userPostProductReq.toJson());
      if (response.statusCode == 200) {
        return Success(Product.fromJson(response.data['product']));
      } else {
        debugPrint(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserDeleteProductRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete('/products/$id');
      if (response.statusCode == 200) {
        return Success(UserDeleteProductRes.fromJson(response.data));
      } else {
        debugPrint(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserUpdateProductRes, Failure>> update(
      {required Product product, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    String id = product.id!;
    try {
      final response = await _dataProvider.post(uri: '/products/$id', data: product.copyWith(id: null).toJson());
      if (response.statusCode == 200) {
        return Success(UserUpdateProductRes.fromJson(response.data));
      } else {
        debugPrint(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }
}
