import 'dart:developer';

import '../models/req/store_post_search_req.dart';
import '../models/res/products.dart';
import 'base.dart';

class ProductsRepository extends BaseRepository {
  ProductsRepository(super.client);

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future<UserProductsListRes?> list({Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/admin/products',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return UserProductsListRes.fromJson(response.data);
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
  Future<UserProductsRes?> retrieve(String id, {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/admin/products/$id',
      );
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

  /// @description Searches for products
  /// @param {StorePostSearchReq} searchOptions is required
  /// @param customHeaders
  /// @return {ResponsePromise<StorePostSearchRes>}
  Future<UserPostSearchRes?> search({StorePostSearchReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/admin/products/search', data: req);
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
}
