import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ResetPasswordUseCase {
  ResetPasswordUseCase(this._medusaAdminV2);

  final MedusaAdminV2 _medusaAdminV2;

  AuthRepository get _authRepository => _medusaAdminV2.auth;

  static ResetPasswordUseCase get instance => getIt<ResetPasswordUseCase>();

  Future<Result<Unit, MedusaError>> call(String email) async {
    try {
      await _authRepository.resetPassword('emailpass', {'email': email});
      return const Success(unit);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
