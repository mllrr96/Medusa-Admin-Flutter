import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DiscountDetailsUseCase {
  final DiscountRepository _discountRepository =
      getIt<MedusaAdmin>().discountRepository;
  final DiscountConditionRepository _discountConditionRepository =
      getIt<MedusaAdmin>().discountConditionRepository;
  static DiscountDetailsUseCase get instance => getIt<DiscountDetailsUseCase>();

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

  Future<Result<UserDeleteDiscountConditionRes, Failure>>
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
    required UserCreateConditionReq userCreateConditionReq,
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
