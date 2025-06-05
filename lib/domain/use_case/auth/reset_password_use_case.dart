import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/repository/authentication_repo.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ResetPasswordUseCase {
  ResetPasswordUseCase(this._authRepo);

  final AuthenticationRepository _authRepo;

  static ResetPasswordUseCase get instance => getIt<ResetPasswordUseCase>();

  Future<Result<Unit, Failure>> call(String email) async {
    try {
      await _authRepo.requestPasswordReset(email);
      return const Success(unit);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
