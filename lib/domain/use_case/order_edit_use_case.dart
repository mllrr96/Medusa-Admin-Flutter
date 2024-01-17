import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrderEditUseCase {
  final OrderEditRepository _orderRepository =
      getIt<MedusaAdmin>().orderEditRepository;
  static OrderEditUseCase get instance => getIt<OrderEditUseCase>();

  Future<Result<OrderEdit, Failure>> cancelOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.cancelOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> requestOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.requestOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> deleteLineItem({
    required String id,
    required String itemId,
  }) async {
    try {
      final result =
          await _orderRepository.deleteLineItem(id: id, itemId: itemId);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> createOrderEdit({
    required String id,
    String? internalNote,
  }) async {
    try {
      final result = await _orderRepository.createOrderEdit(
          id: id, internalNote: internalNote);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> updateOrderEdit({
    required String id,
    String? internalNote,
  }) async {
    try {
      final result = await _orderRepository.updateOrderEdit(
          id: id, internalNote: internalNote);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> upsertLineItemChange({
    required String id,
    required String itemId,
    required int quantity,
  }) async {
    try {
      final result = await _orderRepository.upsertLineItemChange(
          id: id, itemId: itemId, quantity: quantity);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> addLineItem({
    required String id,
    required UserAddLineItemReq userAddLineItemReq,
  }) async {
    try {
      final result = await _orderRepository.addLineItem(
          id: id,userAddLineItemReq: userAddLineItemReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveAllOrderEditRes, Failure>> fetchOrderEdits({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderRepository.retrieveAllOrderEdit(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
