import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdatePriceListUseCase {
  PriceListRepository get _priceListRepository =>
      getIt<MedusaAdmin>().priceListRepository;

  static UpdatePriceListUseCase get instance => getIt<UpdatePriceListUseCase>();

  Future<Result<PriceList, Failure>> create(
      UserCreatePriceListReq userCreatePriceListReq) async {
    try {
      final result = await _priceListRepository.createPriceList(
          userCreatePriceListReq: userCreatePriceListReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> update({
    required UserUpdatePriceListReq userUpdatePriceListReq,
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.updatePriceList(
          id: id, userUpdatePriceListReq: userUpdatePriceListReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<PriceList, Failure>> fetch({
    required String id,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceList(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
