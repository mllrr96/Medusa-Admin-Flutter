import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
@lazySingleton
class CurrenciesUseCase {
  CurrencyRepository get _currencyRepository => getIt<MedusaAdmin>().currencyRepository;

  static CurrenciesUseCase get instance => getIt<CurrenciesUseCase>();

  Future<Result<UserCurrencyRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
}) async {
    try {
      final result = await _currencyRepository.retrieve(queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
