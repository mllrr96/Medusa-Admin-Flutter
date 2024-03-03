import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TaxProviderUseCase {
  StoreRepository get _storeRepository => getIt<MedusaAdmin>().storeRepository;

  static TaxProviderUseCase get instance => getIt<TaxProviderUseCase>();

  Future<Result<List<TaxProvider>, Failure>> call() async {
    try {
      final result = await _storeRepository.retrieveTaxProviders();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
