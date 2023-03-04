import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/repository/auth/base_auth.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_post_auth_req.dart';
import '../../models/res/auth.dart';

class AuthRepo extends BaseAuth {
  AuthRepo();
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  /// Authenticates a user using email and password combination
  @override
  Future<Result<UserAuthRes, Failure>> signIn(
      {required UserPostAuthReq req, Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.dio.post('/auth', data: req);
      if (response.statusCode == 200) {
        var cookie = response.headers['set-cookie']!.first.split(';').first;
        await StorageService.instance.saveCookie(cookie);
        return Success(UserAuthRes.fromJson(response.data));
      } else {
        return Error(Failure(error: response.statusCode));
      }
    } catch (e) {
      return Error(Failure(error: e));
    }
  }

  /// Removes authentication session and sign out
  @override
  Future<bool> signOut({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.dio.delete('/auth');
      if (response.statusCode == 200) {
        return true;
      } else {
        log(response.toString());
        // throw response.statusCode!;
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  /// Retrieves an authenticated session
  @override
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
