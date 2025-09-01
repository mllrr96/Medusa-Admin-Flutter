import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DiscountCrudUseCase {
  DiscountsRepository get _discountRepository => _medusaAdminV2.discounts;
  // DiscountConditionsRepository get _discountConditionRepository =>
  //     _medusaAdminV2.discounts;
  final MedusaAdminV2 _medusaAdminV2;

  DiscountCrudUseCase(this._medusaAdminV2);
  static DiscountCrudUseCase get instance => getIt<DiscountCrudUseCase>();

  Future<Result<DiscountsListRes, MedusaError>> retrieveDiscounts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieveAll(
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
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Discount, MedusaError>> retrieveDiscount(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieve(
        id,
        // query: queryParameters,
      );
      return Success(result.discount);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<bool, MedusaError>> deleteDiscount(
      {required String id}) async {
    try {
      await _discountRepository.delete(id);
      return Success(true);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Discount, MedusaError>> createDiscount({
    required PostDiscountsReq postDiscountsReq,
  }) async {
    try {
      final result = await _discountRepository.create(
          postDiscountsReq);
      return Success(result.discount);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Discount, MedusaError>> updateDiscount({
    required String id,
    required PostDiscountsDiscountReq postDiscountsDiscountReq,
  }) async {
    try {
      final result = await _discountRepository.update(
          id,  postDiscountsDiscountReq);
      return Success(result.discount);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<bool, MedusaError>>
      deleteDiscountCondition({
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

  Future<Result<Discount, MedusaError>> createDiscountCondition({
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

  Future<Result<Discount, MedusaError>> addBatchResources({
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

  Future<Result<Discount, MedusaError>> deleteBatchResources({
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
