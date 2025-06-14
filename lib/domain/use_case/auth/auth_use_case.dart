import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/repository/authentication_repo.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_api_client/gen.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class AuthenticationUseCase {
  AuthenticationUseCase(this._authenticationRepository);

  static AuthenticationUseCase get instance => getIt<AuthenticationUseCase>();
  final AuthenticationRepository _authenticationRepository;

  AuthRepository get _authRepository => getIt<MedusaAdmin>().authRepository;

  Future<Result<(AdminUser, String), Failure>> login(
      {required String email, required String password}) async {
    try {
      final token = await _authenticationRepository.login(email, password);
      await _authenticationRepository.setAuthenticationSession(token);
      final user = await _authenticationRepository.getCurrentUser(token);
      return Success((user, token));
    } catch (e) {
      rethrow;
    }
  }

  Future<Result<String, Failure>> loginCookie(
      {required String email, required String password}) async {
    try {
      final result = await _authRepository.signInCookie(
          req: PostAuthReq(email: email, password: password));
      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<String, Failure>> loginJWT(
      {required String email, required String password}) async {
    try {
      final result = await _authRepository.signInJWT(
          req: PostAuthReq(email: email, password: password));
      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<bool, Failure>> logout() async {
    try {
      await _authenticationRepository.logout();
      return Success(true);
      // final result = await _authRepository.signOut();
      // if (result != null) {
      //   return Success(result);
      // } else {
      //   return Error(Failure(message: 'Error logging out', type: ''));
      // }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<AdminUser, Failure>> getCurrentUser(String jwt) async {
    try {
      final result = await _authenticationRepository.getCurrentUser(jwt);
      return Success(result);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
