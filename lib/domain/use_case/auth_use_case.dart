import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../core/di/di.dart';

@lazySingleton
class AuthenticationUseCase {
  static AuthenticationUseCase get instance =>
      getIt<AuthenticationUseCase>();
  AuthRepository get _authRepository =>
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

  Future<Result<bool, Failure>> logoutCustomer() async {
    try {
      final result = await _authRepository.signOut();
      if(result != null){
        return Success(result);
      } else {
        return Error(Failure(message: 'Error logging out', type:''));
      }
    } on Exception catch (_) {
      return Error(Failure.from(_));
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
