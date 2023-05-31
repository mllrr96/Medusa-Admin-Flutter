import 'dart:developer';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_shipping_option_req.dart';
import 'package:medusa_admin/app/data/models/res/shipping_option_res.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/base_shipping_options.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class ShippingOptionsRepo extends BaseShippingOptions {
  final _dataProvider = DioClient(dio: Dio());

  /// Creates a Shipping Option
  @override
  Future<Result<UserCreateShippingOptionRes, Failure>> create({
    required UserCreateShippingOptionReq userCreateShippingOptionReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/shipping-options', data: userCreateShippingOptionReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserCreateShippingOptionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Shipping Option.
  @override
  Future<Result<UserDeleteShippingOptionRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/shipping-options/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteShippingOptionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Shipping Option.
  @override
  Future<Result<UserRetrieveShippingOptionRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/shipping-options/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveShippingOptionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Shipping Options.
  @override
  Future<Result<UserRetrieveAllShippingOptionRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/shipping-options',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveAllShippingOptionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Shipping Option
  @override
  Future<Result<UserUpdateShippingOptionRes, Failure>> update({
    required String id,
    required UserUpdateShippingOptionReq userUpdateReturnReasonReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/shipping-options',
        data: userUpdateReturnReasonReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateShippingOptionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
