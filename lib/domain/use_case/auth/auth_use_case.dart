import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/repository/authentication_repo.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/di/di.dart';

@lazySingleton
class AuthenticationUseCase {
  AuthenticationUseCase(this._authenticationRepository);
  static AuthenticationUseCase get instance => getIt<AuthenticationUseCase>();
  final AuthenticationRepository _authenticationRepository;
  AuthRepository get _authRepository => getIt<MedusaAdmin>().authRepository;

  Future<Result<User, Failure>> login(
      {required String email, required String password}) async {
    try {
      final token = await _authenticationRepository.login(email, password);
      final user =
          await _authenticationRepository.setAuthenticationSession(token);
      // return Success(user);
      final result = await _authRepository.signIn(
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

  Future<Result<User, Failure>> getCurrentUser() async {
    try {
      final result = await _authRepository.getCurrentUser();
      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
