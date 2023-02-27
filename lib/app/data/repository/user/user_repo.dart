import 'dart:developer';
import 'package:dartz/dartz.dart';
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
  Future<Either<UserCreateUserRes, Failure>> create({
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
        return Left(UserCreateUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserDeleteUserRes, Failure>> delete({
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
        return Left(UserDeleteUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<bool, Failure>> requestPasswordReset({
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
        return const Left(true);
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserResetPasswordRes, Failure>> resetPassword({
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
        return Left(UserResetPasswordRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserRetrieveUserRes, Failure>> retrieve({
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
        return Left(UserRetrieveUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserRetrieveUserListRes, Failure>> retrieveAll(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/users',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserRetrieveUserListRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  @override
  Future<Either<UserUpdateUserRes, Failure>> update({
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
        return Left(UserUpdateUserRes.fromJson(response.data));
      } else {
        log(response.toString());
        return Right(Failure(error: response.statusMessage));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }
}
