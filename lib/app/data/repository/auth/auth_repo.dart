import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/repository/auth/base_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/strings.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_post_auth_req.dart';
import '../../models/res/auth.dart';

class AuthRepo extends BaseAuth {
  AuthRepo();
  final _dataProvider = DioClient(dio: Dio(), baseUrl: AppConstants.baseUrl);

  /// Authenticates a user using email and password combination
  @override
  Future<Either<UserAuthRes, Failure>> signIn(
      {required UserPostAuthReq req, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.dio.post('/auth', data: req);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cookie = response.headers['set-cookie']!.first.split(';').first;
        prefs.setString('Cookie', cookie);
        return left(UserAuthRes.fromJson(response.data));
      } else {
        return Right(Failure(error: response.statusCode));
      }
    } catch (e) {
      return Right(Failure(error: e));
    }
  }

  /// Removes authentication session and sign out
  @override
  Future<void> signOut({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.dio.delete(
        '/auth',
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Retrieves an authenticated session
  ///
  /// Usually used to check if authenticated session is alive.
  ///
  /// @return Future<UserAuthRes?>
  Future<UserAuthRes?> getSession({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.dio.get(
        '/auth',
      );
      if (response.statusCode == 200) {
        return UserAuthRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
