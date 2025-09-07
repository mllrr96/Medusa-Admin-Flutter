import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
@lazySingleton
class CurrenciesUseCase {
  CurrenciesRepository get _currencyRepository => _medusaAdminV2.currencies;

  static CurrenciesUseCase get instance => getIt<CurrenciesUseCase>();
  final MedusaAdminV2 _medusaAdminV2;

  CurrenciesUseCase(this._medusaAdminV2);

  Future<Result<CurrenciesListRes, MedusaError>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _currencyRepository.list(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
