import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DiscountCrudUseCase {
  DiscountRepository get _discountRepository =>
      getIt<MedusaAdmin>().discountRepository;
  DiscountConditionRepository get _discountConditionRepository =>
      getIt<MedusaAdmin>().discountConditionRepository;
  static DiscountCrudUseCase get instance => getIt<DiscountCrudUseCase>();


  Future<Result<RetrieveDiscountsRes, Failure>> retrieveDiscounts(
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

  Future<Result<Discount, Failure>> retrieveDiscount(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieveDiscount(
        id: id,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<DeleteDiscountRes, Failure>> deleteDiscount(
      {required String id}) async {
    try {
      final result = await _discountRepository.deleteDiscount(id: id);
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

  Future<Result<DeleteDiscountConditionRes, Failure>>
      deleteDiscountCondition({
    required String discountId,
    required String conditionId,
  }) async {
    try {
      final result = await _discountConditionRepository.deleteDiscountCondition(
          discountId: discountId, conditionId: conditionId);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Discount, Failure>> createDiscountCondition({
    required String discountId,
    required CreateConditionReq userCreateConditionReq,
  }) async {
    try {
      final result = await _discountConditionRepository.createDiscountCondition(
          discountId: discountId,
          userCreateConditionReq: userCreateConditionReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Discount, Failure>> addBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
  }) async {
    try {
      final result = await _discountConditionRepository.addBatchResources(
          discountId: discountId, conditionId: conditionId, itemIds: itemIds);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Discount, Failure>> deleteBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
  }) async {
    try {
      final result = await _discountConditionRepository.deleteBatchResources(
          discountId: discountId, conditionId: conditionId, itemIds: itemIds);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
