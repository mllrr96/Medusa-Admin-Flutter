import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrderEditCrudUseCase {
  OrderEditRepository get _orderRepository =>
      getIt<MedusaAdmin>().orderEditRepository;
  static OrderEditCrudUseCase get instance => getIt<OrderEditCrudUseCase>();

  Future<Result<OrderEdit, MedusaError>> cancelOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.cancelOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, MedusaError>> requestOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.requestOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, MedusaError>> deleteLineItem({
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

  Future<Result<OrderEdit, MedusaError>> createOrderEdit({
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

  Future<Result<OrderEdit, MedusaError>> updateOrderEdit({
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
  Future<Result<DeleteLineItemChangeRes, MedusaError>> deleteLineItemChange({
    required String id,
    required String changeId,
  }) async {
    try {
      final result = await _orderRepository.deleteLineItemChange(
          id: id, changeId: changeId);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, MedusaError>> confirmOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.confirmOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<DeleteOrderEditRes, MedusaError>> deleteOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.deleteOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, MedusaError>> upsertLineItemChange({
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

  Future<Result<OrderEdit, MedusaError>> addLineItem({
    required String id,
    required AddLineItemReq payload,
  }) async {
    try {
      final result = await _orderRepository.addLineItem(
          id: id, userAddLineItemReq: payload);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<RetrieveAllOrderEditRes, MedusaError>> fetchOrderEdits({
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
