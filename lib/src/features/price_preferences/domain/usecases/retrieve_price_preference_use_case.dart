
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class RetrievePricePreferenceUseCase {
  PricePreferencesRepository get _pricePreferencesRepository => _medusa.pricePreferences;

  final MedusaAdminV2 _medusa;
  RetrievePricePreferenceUseCase(this._medusa);

  static RetrievePricePreferenceUseCase get instance => getIt<RetrievePricePreferenceUseCase>();

  Future<Result<PricePreferenceRes, MedusaError>> call(String id) async {
    try {
      final result = await _pricePreferencesRepository.retrieve(id: id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
