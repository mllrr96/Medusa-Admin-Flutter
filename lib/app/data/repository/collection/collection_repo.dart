import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/collection.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/req/user_collection_req.dart';
import '../../service/storage_service.dart';
import 'base_collection.dart';

class CollectionRepo extends BaseCollection {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  @override
  Future<Result<UserCollectionRes, Failure>> retrieve(
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
        return Success(UserCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCollectionsRes, Failure>> retrieveAll(
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
        return Success(UserCollectionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCreateCollectionRes, Failure>> create(
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
        return Success(UserCreateCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCreateCollectionRes, Failure>> update(
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
        return Success(UserCreateCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCollectionUpdateProductsRes, Failure>> updateProducts(
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
        return Success(UserCollectionUpdateProductsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCollectionRemoveProductsRes, Failure>> removeProducts(
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
        return Success(UserCollectionRemoveProductsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserDeleteCollectionRes, Failure>> delete(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete('/collections/$id');
      if (response.statusCode == 200) {
        return Success(UserDeleteCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
