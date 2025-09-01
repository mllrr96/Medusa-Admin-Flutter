import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PaymentProviderUseCase {
  StoreRepository get _storeRepository => getIt<MedusaAdmin>().storeRepository;

  static PaymentProviderUseCase get instance => getIt<PaymentProviderUseCase>();

  Future<Result<List<PaymentProvider>, MedusaError>> call() async {
    try {
      final result = await _storeRepository.retrievePaymentProviders();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
