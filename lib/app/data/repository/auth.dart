import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/req/user_post_auth_req.dart';
import '../models/res/auth.dart';
import 'base.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.client);

  /// @description Authenticates a customer using email and password combination
  /// @param {UserPostAuthReq} payload authentication payload
  /// @param customHeaders
  /// @return {ResponsePromise<UserAuthRes?>}
  Future<UserAuthRes?> authenticate({UserPostAuthReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      Response response = await client.post('/admin/auth', data: req);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cookie = response.headers['set-cookie']!.first.split(';').first;
        prefs.setString('Cookie', cookie);
        return UserAuthRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Removes authentication session
  /// @return {ResponsePromise<void>}
  Future<void> deleteSession({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete(
        '/admin/auth',
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

  /// @description Retrieves an authenticated session
  /// Usually used to check if authenticated session is alive.
  /// @param customHeaders
  /// @return {ResponsePromise<UserAuthRes?>}
  Future<UserAuthRes?> getSession({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/admin/auth',
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
