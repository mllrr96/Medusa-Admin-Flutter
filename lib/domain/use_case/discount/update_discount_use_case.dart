import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateDiscountUseCase {
  DiscountsRepository get _discountRepository => _medusaAdminV2.discounts;
  final MedusaAdminV2 _medusaAdminV2;

  UpdateDiscountUseCase(this._medusaAdminV2);

  static UpdateDiscountUseCase get instance => getIt<UpdateDiscountUseCase>();

  Future<Result<Discount, MedusaError>> updateDiscount({
    required String id,
    required PostDiscountsDiscountReq postDiscountsDiscountReq,
  }) async {
    try {
      final result = await _discountRepository.update(id, postDiscountsDiscountReq);
      return Success(result.discount);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Discount, MedusaError>> createDiscount({
    required PostDiscountsReq postDiscountsReq,
  }) async {
    try {
      final result = await _discountRepository.create(postDiscountsReq);
      return Success(result.discount);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
