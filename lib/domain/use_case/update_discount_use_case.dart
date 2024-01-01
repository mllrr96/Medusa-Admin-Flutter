import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

class UpdateDiscountUseCase {
  final DiscountRepository _discountRepository =
      getIt<MedusaAdmin>().discountRepository;
  static UpdateDiscountUseCase get instance => getIt<UpdateDiscountUseCase>();

  Future<Result<Discount, Failure>> updateDiscount({
    required String id,
    required UserUpdateDiscountReq userUpdateDiscountReq,
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
    required UserCreateDiscountReq userCreateDiscountReq,
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
