import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
@injectable
class CurrenciesUseCase {
  final CurrencyRepository _currencyRepository = getIt<MedusaAdmin>().currencyRepository;

  static CurrenciesUseCase instance = getIt<CurrenciesUseCase>();

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
