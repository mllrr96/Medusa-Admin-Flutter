import 'package:injectable/injectable.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../app/data/models/app/api_error_handler.dart';
import '../../di/di.dart';

@lazySingleton
class AuthenticationUseCase {
  static AuthenticationUseCase get instance =>
      getIt<AuthenticationUseCase>();
  final AuthRepository _authRepository =
      getIt<MedusaAdmin>().authRepository;
  Future<Result<User, Failure>> login(
      {required String email, required String password}) async {
    try {
      final result = await _authRepository.signIn(
          req: UserPostAuthReq(email: email, password: password));

      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<bool> logoutCustomer() async {
    try {
      final result = await _authRepository.signOut();
      return result;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Result<User, Failure>> getSession() async {
    try {
      final result = await _authRepository.getSession();
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
