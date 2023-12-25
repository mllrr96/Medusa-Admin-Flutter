import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/dio/dio_client.dart';
import 'package:medusa_admin/app/data/repository/auth/base_auth.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_post_auth_req.dart';
import '../../models/res/auth.dart';

class AuthRepo extends BaseAuth {
  final _dataProvider = DioClient(dio: Dio());

  /// Authenticates a user using email and password combination
  @override
  Future<Result<UserAuthRes, Failure>> signIn({
    required UserPostAuthReq req,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    _dataProvider.dio.options.connectTimeout = const Duration(seconds: 10);
    try {
      final response = await _dataProvider.post(uri: '/auth', data: req);
      if (response.statusCode == 200) {
        var cookie = response.headers['set-cookie']?.firstOrNull?.split(';').firstOrNull;
        // final string = response.headers['set-cookie']!.first.split(';')[2].replaceAll(' Expires=', '');
        // final formatter = DateFormat('EEE, d MMM yyyy HH:mm:ss');
        // final dateTime = formatter.parse(string);
        // print(dateTime.difference(DateTime.now()).inHours);
        if (cookie != null) {
          await StorageService.instance.saveCookie(cookie);
        }
        return Success(UserAuthRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Removes authentication session and sign out
  @override
  Future<bool> signOut({
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/auth');
      if (response.statusCode == 200) {
        return true;
      } else {
        log(response.toString());
        return false;
      }
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  /// Retrieves an authenticated session
  @override
  Future<Result<UserAuthRes, Failure>> getSession({
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/auth',
      );
      if (response.statusCode == 200) {
        return Success(UserAuthRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error) {
      log(error.toString());
      return Error(Failure.from(error));
    }
  }
}
