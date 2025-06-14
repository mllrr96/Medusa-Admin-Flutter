import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/medusa_client.dart';
import 'package:medusa_api_client/gen.dart';

@lazySingleton
class AuthenticationRepository {
  AuthenticationRepository(this._medusaClient);

  final MedusaClient _medusaClient;

  AuthClient get _authClient => _medusaClient.client.authClient;

  UsersClient get _usersClient => _medusaClient.client.usersClient;

  Future<AdminUser> getCurrentUser(String jwt) async {
    final session = await _usersClient.getUsersMe(options: Options(
      headers: {
        'Authorization': 'Bearer $jwt',
      },
    ));
    return session.data.user;
  }

  Future<void> setAuthenticationSession(String jwt) async {
    await _authClient.postSession(
      authorization: 'Bearer $jwt',
    );
  }

  Future<String> login(String email, String password) async {
    final response = await _authClient.postActorTypeAuthProvider(
      requestBody: {
        'email': email,
        'password': password,
      },
      authProvider: 'emailpass',
    );
    return response.data.token;
  }

  Future<void> logout() async => await _authClient.deleteSession();

  Future<void> register(String email, String password) async {
    await _authClient.postActorTypeAuthProvider(
      requestBody: {
        'email': email,
        'password': password,
      },
      authProvider: 'emailpass',
    );
  }

  Future<void> requestPasswordReset(String email) async {
    await _authClient.postActorTypeAuthProviderResetPassword(
      requestBody: {'email': email},
      authProvider: 'emailpass',
    );
  }
}
