import 'dart:developer';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_create_user_req.dart';
import 'package:medusa_admin/app/data/models/req/user_reset_password_req.dart';
import 'package:medusa_admin/app/data/models/req/user_update_user_req.dart';
import 'package:medusa_admin/app/data/models/res/user.dart';
import 'package:medusa_admin/app/data/repository/user/base_user.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../service/storage_service.dart';

class UserRepo extends BaseUser {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  @override
  Future<Result<UserCreateUserRes, Failure>> create({
    required UserCreateUserReq userCreateUserReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/users',
        data: userCreateUserReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserCreateUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserDeleteUserRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/users/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<bool, Failure>> requestPasswordReset({
    required String email,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/users/password-token',
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        return const Success(true);
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserResetPasswordRes, Failure>> resetPassword({
    required UserResetPasswordReq userResetPasswordReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/users/reset-password',
        data: userResetPasswordReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserResetPasswordRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRetrieveUserRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/users/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRetrieveUserListRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/users',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveUserListRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserUpdateUserRes, Failure>> update({
    required String id,
    required UserUpdateUserReq userUpdateUserReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/users/$id',
        data: userUpdateUserReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
