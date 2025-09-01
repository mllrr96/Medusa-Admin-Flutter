import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TaxProviderUseCase {
  TaxProvidersRepository get _taxProviderRepository => _medusaAdmin.taxProviders;

  static TaxProviderUseCase get instance => getIt<TaxProviderUseCase>();
  final MedusaAdminV2 _medusaAdmin;

  TaxProviderUseCase(this._medusaAdmin);

  Future<Result<List<TaxProvider>, MedusaError>> call() async {
    try {
      final result = await _taxProviderRepository.list();
      return Success(result.taxProviders);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
