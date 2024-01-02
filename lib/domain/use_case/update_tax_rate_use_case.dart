import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class UpdateTaxRateUseCase {
  final TaxRateRepository _taxRateRepository =
      getIt<MedusaAdmin>().taxRateRepository;
  static UpdateTaxRateUseCase instance = getIt<UpdateTaxRateUseCase>();

  Future<Result<TaxRate, Failure>> create(
      UserCreateTaxRateReq userCreateTaxRateReq) async {
    try {
      final result = await _taxRateRepository.createTaxRate(
          userCreateTaxRateReq: userCreateTaxRateReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<TaxRate, Failure>> update({
    required String id,
    required UserUpdateTaxRateReq userUpdateTaxRateReq,
  }) async {
    try {
      final result = await _taxRateRepository.updateTaxRate(
          id: '', userUpdateTaxRateReq: userUpdateTaxRateReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
