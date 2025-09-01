import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateRegionUseCase {
  StoreRepository get _storeRepository => getIt<MedusaAdmin>().storeRepository;
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;

  static UpdateRegionUseCase get instance => getIt<UpdateRegionUseCase>();

  Future<Result<List<PaymentProvider>, MedusaError>> fetchPaymentProviders() async {
    try {
      final result = await _storeRepository.retrievePaymentProviders();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> create(
      CreateRegionReq userCreateRegionReq) async {
    try {
      final result = await _regionsRepository.create(
          userCreateRegionReq: userCreateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> update({
    required String id,
    required UpdateRegionReq userUpdateRegionReq,
  }) async {
    try {
      final result = await _regionsRepository.update(
          id: id, userUpdateRegionReq: userUpdateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
