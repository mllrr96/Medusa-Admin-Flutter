import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/repository/orders_repository.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersUseCase {
  OrdersUseCase(this._ordersRepository);

  final OrdersRepository _ordersRepository;

  static OrdersUseCase get instance => getIt<OrdersUseCase>();

  Future<Result<GetOrders200Response, MedusaError>> retrieveOrders(
      // {GetOrdersQueryParameters? queryParameters},
      ) async {
    try {
      final result = await _ordersRepository.listOrders();
      return Success(result);
    } on DioException catch (e) {
      if (e.error is MedusaError) {
        return Error(e.error as MedusaError);
      } else {
        if (kDebugMode) {
          log(e.type.toString());
          log(e.response?.data.toString() ?? 'No response data');
          log(e.stackTrace.toString());
          log(e.error.toString());
        }
        return Error(MedusaError((b) => b.message = 'Network error or unexpected issue'));
      }
    } catch (e, stack) {
      if (kDebugMode) {
        log(e.toString());
        log(stack.toString());
      }
      return Error(MedusaError((b) => b.message = 'Unexpected error occurred'));
    }
  }

  Future<Result<AdminOrder, MedusaError>> updateOrder({
    required String id,
    required AdminUpdateOrder payload,
    // PostOrdersIdQueryParameters? queryParameters,
  }) async {
    try {
      final result = await _ordersRepository.updateOrder(
        id: id,
        requestBody: payload,
        // query: queryParameters,
      );
      return Success(result.order!);
    } on DioException catch (e) {
      if (e.error is MedusaError) {
        return Error(e.error as MedusaError);
      } else {
        if (kDebugMode) {
          log(e.type.toString());
          log(e.response?.data.toString() ?? 'No response data');
          log(e.stackTrace.toString());
          log(e.error.toString());
        }
        return Error(MedusaError((b) => b.message = 'Network error or unexpected issue'));
      }
    } catch (e, stack) {
      if (kDebugMode) {
        log(e.toString());
        log(stack.toString());
      }
      return Error(MedusaError((b) => b.message = 'Unexpected error occurred'));
    }
  }
}
