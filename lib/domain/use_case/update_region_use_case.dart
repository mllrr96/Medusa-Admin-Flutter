import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateRegionUseCase {
  final StoreRepository _storeRepository = getIt<MedusaAdmin>().storeRepository;
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;

  static UpdateRegionUseCase get instance => getIt<UpdateRegionUseCase>();

  Future<Result<List<PaymentProvider>, Failure>> fetchPaymentProviders() async {
    try {
      final result = await _storeRepository.retrievePaymentProviders();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, Failure>> create(
      UserCreateRegionReq userCreateRegionReq) async {
    try {
      final result = await _regionsRepository.create(
          userCreateRegionReq: userCreateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, Failure>> update({
    required String id,
    required UserUpdateRegionReq userUpdateRegionReq,
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
