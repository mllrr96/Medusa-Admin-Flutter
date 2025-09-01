import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SignOutUseCase {
  SignOutUseCase(this._medusaAdminV2);

  final MedusaAdminV2 _medusaAdminV2;

  AuthRepository get _authRepository => _medusaAdminV2.auth;

  static SignOutUseCase get instance => getIt<SignOutUseCase>();

  Future<Result<bool, MedusaError>> call() async {
    try {
      final result = await _authRepository.logout();
      return Success(result.success);
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
