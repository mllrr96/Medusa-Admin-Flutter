import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class AuthenticationUseCase {
  AuthenticationUseCase(this._medusaAdminV2);

  static AuthenticationUseCase get instance => getIt<AuthenticationUseCase>();

  AuthRepository get _authenticationRepository => _medusaAdminV2.auth;

  UsersRepository get _usersRepository => _medusaAdminV2.users;
  final MedusaAdminV2 _medusaAdminV2;

  Future<Result<String, MedusaError>> login(
      {required String email, required String password}) async {
    try {
      final user = await _authenticationRepository
          .authProvider('emailpass', {'email': email, 'password': password});
      if (user is Map<String, dynamic>) {
        return Success(user['token'] as String);
      } else {
        return Error(MedusaError(
            code: 'invalid_response',
            type: 'Invalid Response',
            message: 'The response from the server was not as expected.'));
      }
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<bool, MedusaError>> logout() async {
    try {
      await _authenticationRepository.logout();
      return const Success(true);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<SessionUser, MedusaError>> postSession(String token) async {
    try {
      final result =
          await _authenticationRepository.postSession('Bearer $token');
      return Success(result.user);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<User, MedusaError>> getCurrentUser({String? fields}) async {
    try {
      final result = await _usersRepository.retrieveMe(fields: fields);
      return Success(result.user);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
