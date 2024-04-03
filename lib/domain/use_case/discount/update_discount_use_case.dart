import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateDiscountUseCase {
  DiscountRepository get _discountRepository =>
      getIt<MedusaAdmin>().discountRepository;
  static UpdateDiscountUseCase get instance => getIt<UpdateDiscountUseCase>();

  Future<Result<Discount, Failure>> updateDiscount({
    required String id,
    required UpdateDiscountReq userUpdateDiscountReq,
  }) async {
    try {
      final result = await _discountRepository.updateDiscount(
          id: id, userUpdateDiscountReq: userUpdateDiscountReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Discount, Failure>> createDiscount({
    required CreateDiscountReq userCreateDiscountReq,
  }) async {
    try {
      final result = await _discountRepository.createDiscount(
          userCreateDiscountReq: userCreateDiscountReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
