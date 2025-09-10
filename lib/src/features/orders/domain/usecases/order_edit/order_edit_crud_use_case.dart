import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrderEditCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  OrderEditCrudUseCase(this._medusaAdmin);

  OrderEditsRepository get _orderRepository => _medusaAdmin.orderEdits;

  static OrderEditCrudUseCase get instance => getIt<OrderEditCrudUseCase>();

  Future<Result<OrderEditDeleteRes, MedusaError>> cancelOrderEdit({
    required String id,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _orderRepository.cancel(id: id);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error, stack) {
    //   if (kDebugMode) {
    //     log(error.toString());
    //     log(stack.toString());
    //   }
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<Order, MedusaError>> requestOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.request(id: id);
      return Success(result.orderPreview);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<OrderEdit, MedusaError>> deleteLineItem({
    required String id,
    required String itemId,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _orderRepository.deleteLineItem(id: id, itemId: itemId);
    //   return Success(result!);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error, stack) {
    //   if (kDebugMode) {
    //     log(error.toString());
    //     log(stack.toString());
    //   }
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<OrderEdit, MedusaError>> createOrderEdit({
    required CreateOrderEditReq payload,
  }) async {
    try {
      final result = await _orderRepository.create(body: payload);
      return Success(result.orderEdit);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<OrderEdit, MedusaError>> updateOrderEdit({
    required String id,
    String? internalNote,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _orderRepository.updateOrderEdit(
    //       id: id, internalNote: internalNote);
    //   return Success(result!);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error, stack) {
    //   if (kDebugMode) {
    //     log(error.toString());
    //     log(stack.toString());
    //   }
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  // Future<Result<DeleteLineItemChangeRes, MedusaError>> deleteLineItemChange({
  //   required String id,
  //   required String changeId,
  // }) async {
  //   try {
  //     final result = await _orderRepository.deleteLineItemChange(
  //         id: id, changeId: changeId);
  //     return Success(result!);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error, stack) {
  //     if (kDebugMode) {
  //       log(error.toString());
  //       log(stack.toString());
  //     }
  //     return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }

  Future<Result<Order, MedusaError>> confirmOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.confirm(id: id);
      return Success(result.orderPreview);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<OrderEditDeleteRes, MedusaError>> deleteOrderEdit({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.cancel(id: id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  //
  // Future<Result<OrderEdit, MedusaError>> upsertLineItemChange({
  //   required String id,
  //   required String itemId,
  //   required int quantity,
  // }) async {
  //   try {
  //     final result = await _orderRepository.upsertLineItemChange(
  //         id: id, itemId: itemId, quantity: quantity);
  //     return Success(result!);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error, stack) {
  //     if (kDebugMode) {
  //       log(error.toString());
  //       log(stack.toString());
  //     }
  //     return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }

  Future<Result<Order, MedusaError>> addLineItem({
    required String id,
    required AddItemsToOrderEditReq payload,
  }) async {
    try {
      final result = await _orderRepository.addItems(id: id, body: payload);
      return Success(result.orderPreview);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<OrderEditListRes, MedusaError>> fetchOrderEdits({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
