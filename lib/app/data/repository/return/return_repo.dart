import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_order.dart';
import 'package:medusa_admin/app/data/models/res/orders.dart';
import 'package:medusa_admin/app/data/models/res/return.dart';
import 'package:medusa_admin/app/data/repository/return/base_return.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/req/user_return_req.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class ReturnRepo extends BaseReturn {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserCancelReturnOrderRes, Failure>> cancelReturn({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/return',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserCancelReturnOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserReceiveReturnOrderRes, Failure>> receiveReturn({
    required String id,
    required UserReceiveReturnOrderReq userReceiveReturnOrderReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/returns/$id/receive',
        data: userReceiveReturnOrderReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserReceiveReturnOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRequestReturnOrderRes, Failure>> requestReturn({
    required String id,
    required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/return',
        data: userRequestReturnOrdersReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRequestReturnOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveReturnsRes, Failure>> retrieveReturns({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/returns',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveReturnsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
