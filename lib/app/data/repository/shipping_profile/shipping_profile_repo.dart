import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_shipping_profile_req.dart';
import 'package:medusa_admin/app/data/models/res/shipping_profile.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../service/dio_service.dart';
import 'base_shipping_profile.dart';

class ShippingProfileRepo extends BaseShippingProfile {
  final _dataProvider = DioService.instance.dio;

  /// Creates a Shipping Profile
  @override
  Future<Result<UserCreateShippingProfileRes, Failure>> create({
    required UserCreateShippingProfileReq userCreateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/shipping-profiles', data: userCreateShippingProfileReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserCreateShippingProfileRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Shipping Profile.
  @override
  Future<Result<UserDeleteShippingProfileRes, Failure>> delete({
    /// The ID of the Shipping Profile to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/shipping-profiles/$id');
      if (response.statusCode == 200) {
        return Success(UserDeleteShippingProfileRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Shipping Profile.
  @override
  Future<Result<UserRetrieveShippingProfileRes, Failure>> retrieve({
    /// The ID of the Shipping Profile.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/shipping-profiles/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveShippingProfileRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Shipping Profile.
  @override
  Future<Result<UserRetrieveAllShippingProfileRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/shipping-profiles',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveAllShippingProfileRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Shipping Profile
  @override
  Future<Result<UserUpdateShippingProfileRes, Failure>> update({
    /// The ID of the Shipping Profile.
    required String id,
    required UserUpdateShippingProfileReq userUpdateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/shipping-profiles',
        data: userUpdateShippingProfileReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateShippingProfileRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
