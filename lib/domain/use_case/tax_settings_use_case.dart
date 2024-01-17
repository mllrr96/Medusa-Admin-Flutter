import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TaxSettingsUseCase {
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;
  final TaxRateRepository _taxRateRepository =
      getIt<MedusaAdmin>().taxRateRepository;
  final StoreRepository _storeRepository = getIt<MedusaAdmin>().storeRepository;

  static TaxSettingsUseCase get instance => getIt<TaxSettingsUseCase>();

  Future<Result<UserRegionsRes, Failure>> fetchRegions({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<List<TaxProvider>, Failure>> fetchTaxProviders() async {
    try {
      final result = await _storeRepository.retrieveTaxProviders();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveTaxRatesRes, Failure>> fetchTaxRates({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _taxRateRepository.retrieveTaxRates(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteTaxRateRes, Failure>> deleteTaxRate(String id) async {
    try {
      final result = await _taxRateRepository.deleteTaxRate(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
