import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DiscountsUseCase {
  final DiscountRepository _discountRepository =
      getIt<MedusaAdmin>().discountRepository;
  static DiscountsUseCase get instance => getIt<DiscountsUseCase>();

  Future<Result<UserRetrieveDiscountsRes, Failure>> retrieveDiscounts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieveDiscounts(
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteDiscountRes, Failure>> deleteDiscount(
      {required String id}) async {
    try {
      final result = await _discountRepository.deleteDiscount(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

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
}
