import 'dart:developer';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_return_reason.dart';
import 'package:medusa_admin/app/data/models/res/return_reason.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../service/storage_service.dart';
import 'base_return_reason.dart';

class ReturnReasonRepo extends BaseReturnReason {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);
  static const String _returnReasons = '/return-reasons';
  @override
  Future<Result<UserCreateReturnReasonRes, Failure>> create({
    required UserCreateReturnReasonReq userCreateReturnReasonReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: _returnReasons,
        data: userCreateReturnReasonReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserCreateReturnReasonRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserDeleteReturnReasonRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete('$_returnReasons/$id');
      if (response.statusCode == 200) {
        return Success(UserDeleteReturnReasonRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserRetrieveReturnReasonRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: _returnReasons,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveReturnReasonRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserRetrieveAllReturnReasonRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: _returnReasons,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveAllReturnReasonRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserUpdateReturnReasonRes, Failure>> update({
    required String id,
    required UserUpdateReturnReasonReq userUpdateReturnReasonReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '$_returnReasons/$id',
        data: userUpdateReturnReasonReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateReturnReasonRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }
}
