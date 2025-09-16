import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PromotionCrudUseCase {
  PromotionsRepository get _discountRepository => _medusaAdminV2.promotions;

  // PromotionConditionsRepository get _discountConditionRepository =>
  //     _medusaAdminV2.promotions;
  final MedusaAdminV2 _medusaAdminV2;

  PromotionCrudUseCase(this._medusaAdminV2);

  static PromotionCrudUseCase get instance => getIt<PromotionCrudUseCase>();

  Future<Result<PromotionsListResponse, MedusaError>> retrievePromotions(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.list(
        queryParameters: queryParameters,
      );
      return Success(result);
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

  Future<Result<Promotion, MedusaError>> retrievePromotion(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieve(
        id: id,
        queryParameters: queryParameters,
      );
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

  Future<Result<bool, MedusaError>> deletePromotion({required String id}) async {
    try {
      await _discountRepository.delete(id: id);
      return Success(true);
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

  Future<Result<Promotion, MedusaError>> createPromotion({
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

  Future<Result<Promotion, MedusaError>> updatePromotion({
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

  Future<Result<bool, MedusaError>> deletePromotionCondition({
    required String discountId,
    required String conditionId,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _discountConditionRepository.delete(
    //       discountId,  conditionId);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<Promotion, MedusaError>> createPromotionCondition({
    required String discountId,
    // required CreateConditionReq userCreateConditionReq,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _discountConditionRepository.create(
    //       discountId,
    //        userCreateConditionReq);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<Promotion, MedusaError>> addBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _discountConditionRepository.addBatchResources(
    //       discountId,  conditionId,  AddBatchResourcesReq(resources: itemIds));
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<Promotion, MedusaError>> deleteBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _discountConditionRepository.removeBatchResources(
    //       discountId,  conditionId,  DeleteBatchResourcesReq(resources: itemIds));
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(
    //       MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }
}
