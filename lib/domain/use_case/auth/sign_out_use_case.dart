import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/repository/authentication_repo.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SignOutUseCase {
  SignOutUseCase(this._authRepo);

  final AuthenticationRepository _authRepo;

  static SignOutUseCase get instance => getIt<SignOutUseCase>();

  Future<Result<Unit, Failure>> call() async {
    try {
      await _authRepo.logout();
      return const Success(unit);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
