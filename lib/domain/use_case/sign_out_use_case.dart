import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SignOutUseCase {
  AuthRepository get _authRepository =>
      getIt<MedusaAdmin>().authRepository;

  static SignOutUseCase get instance => getIt<SignOutUseCase>();

  Future<Result<bool, Failure>> call(
      ) async {
    try {
      final result = await _authRepository.signOut();
      return Success(result);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

}
