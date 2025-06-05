import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/medusa_client.dart';
import 'package:medusa_api_client/gen.dart';

@lazySingleton
class AuthenticationRepository {
  AuthenticationRepository(this._medusaClient);

  final MedusaClient _medusaClient;

  AuthClient get _authClient => _medusaClient.client.authClient;

  Future<AdminUser> setAuthenticationSession(String jwt) async {
    final session = await _authClient.postSession(
      authorization: 'Bearer $jwt',
    );
    return session.data.user;
  }

  Future<String> login(String email, String password) async {
    final response = await _authClient.postActorTypeAuthProvider(
      requestBody: {
        'email': email,
        'password': password,
      },
      authProvider: 'emailpass',
    );
    // TODO: double check if this is the correct way to handle the response
    return (response.data.value as AuthResponse).token;
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
      requestBody: {'email': email}, authProvider: 'emailpass',
    );
  }

}
