import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ResetPasswordUseCase {
  UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;

  static ResetPasswordUseCase get instance => getIt<ResetPasswordUseCase>();

  Future<Result<bool, Failure>> call(String email) async {
    try {
      final result = await _userRepository.requestPasswordReset(email: email);
      if (result == true) {
        return const Success(true);
      } else {
        return Error(
            Failure.from('Error sending reset instructions, unknown error'));
      }
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
