import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_create_collection_req.dart';
import 'package:medusa_admin/app/data/models/req/user_post_collection_remove_products_req.dart';
import 'package:medusa_admin/app/data/models/req/user_post_collection_update_products_req.dart';
import 'package:medusa_admin/app/data/models/res/collection.dart';
import '../../../../core/utils/strings.dart';
import '../../datasource/remote/dio/dio_client.dart';
import 'base_collection.dart';

class CollectionRepo extends BaseCollection {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: AppConstants.baseUrl);

  @override
  Future<Either<UserCollectionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/collections/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCollectionRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserCollectionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/collections',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCollectionsRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserCreateCollectionRes, Failure>> create(
      {required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/collections',
        data: userCreateCollectionReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCreateCollectionRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserCreateCollectionRes, Failure>> update(
      {required String id,
      required UserCreateCollectionReq userCreateCollectionReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/collections/$id',
        data: userCreateCollectionReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCreateCollectionRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserCollectionUpdateProductsRes, Failure>> updateProducts(
      {required UserCollectionUpdateProductsReq userCollectionUpdateProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/collections/${userCollectionUpdateProductsReq.collectionId}/products/batch',
        data: {'product_ids': userCollectionUpdateProductsReq.productsIds},
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCollectionUpdateProductsRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserCollectionRemoveProductsRes, Failure>> removeProducts(
      {required UserCollectionRemoveProductsReq userCollectionRemoveProductsReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/collections/${userCollectionRemoveProductsReq.collectionId}/products/batch',
        data: {'product_ids': userCollectionRemoveProductsReq.productsIds},
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCollectionRemoveProductsRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserDeleteCollectionRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete('/collections/$id');
      if (response.statusCode == 200) {
        return Left(UserDeleteCollectionRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }
}
