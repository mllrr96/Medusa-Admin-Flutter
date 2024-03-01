import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftCrudUseCase {
  DraftOrderRepository get _draftRepository =>
      getIt<MedusaAdmin>().draftOrderRepository;
  static DraftCrudUseCase get instance => getIt<DraftCrudUseCase>();

  Future<Result<DraftOrder, Failure>> retrieveDraftOrder({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.retrieveDraftOrder(
          id: id, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDraftOrdersRes, Failure>> retrieveDraftOrders({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.retrieveDraftOrders(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteDraftOrderRes, Failure>> cancelDraft({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.deleteDraftOrder(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DraftOrder, Failure>> update({
    required String id,
    required UserUpdateDraftOrderReq userUpdateDraftOrderReq,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.updateDraftOrder(
          id: id, userUpdateDraftOrderReq: userUpdateDraftOrderReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DraftOrder, Failure>> create({
    required UserCreateDraftOrderReq userCreateDraftOrderReq,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.createDraftOrder(
          userCreateDraftOrderReq: userCreateDraftOrderReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Order, Failure>> registerPayment({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.registerPayment(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
