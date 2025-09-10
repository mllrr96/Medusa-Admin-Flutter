import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateDiscountUseCase {
  PromotionsRepository get _discountRepository => _medusaAdminV2.promotions;
  final MedusaAdminV2 _medusaAdminV2;

  UpdateDiscountUseCase(this._medusaAdminV2);

  static UpdateDiscountUseCase get instance => getIt<UpdateDiscountUseCase>();

  Future<Result<Promotion, MedusaError>> updateDiscount({
    required String id,
    required PostPromotionReq payload,
  }) async {
    try {
      final result = await _discountRepository.update(id: id, payload: payload);
      return Success(result.promotion);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Promotion, MedusaError>> createDiscount({
    required PostPromotionReq payload,
  }) async {
    try {
      final result = await _discountRepository.create(payload: payload);
      return Success(result.promotion);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
