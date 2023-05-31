import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/store_post_req.dart';
import 'package:medusa_admin/app/data/repository/store/base_store.dart';

import '../../datasource/remote/dio/dio_client.dart';
import '../../models/res/store.dart';

class StoreRepo extends BaseStore {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserStoreRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(uri: '/store', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(UserStoreRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserStoreRes, Failure>> update(
      {required StorePostReq storePostReq, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(uri: '/store', data: storePostReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserStoreRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserStoreRetrievePaymentProvidersRes, Failure>> retrievePaymentProviders({
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/store/payment-providers',
      );
      if (response.statusCode == 200) {
        return Success(UserStoreRetrievePaymentProvidersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserStoreRetrieveTaxProvidersRes, Failure>> retrieveTaxProviders({
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/store/tax-providers',
      );
      if (response.statusCode == 200) {
        return Success(UserStoreRetrieveTaxProvidersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
