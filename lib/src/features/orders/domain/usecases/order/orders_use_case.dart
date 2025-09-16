import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersUseCase {
  OrdersUseCase(this._medusaAdminV2);
  final MedusaAdminV2 _medusaAdminV2;

  OrdersRepository get _ordersRepository => _medusaAdminV2.orders;

  static OrdersUseCase get instance => getIt<OrdersUseCase>();

  Future<Result<OrdersListRes, MedusaError>> retrieveOrders(
      Map<String, dynamic>? queryParameters) async {
    try {
      final result =
          await _ordersRepository.list(queryParameters: queryParameters);
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

  Future<Result<Order, MedusaError>> updateOrder({
    required String id,
    required PostOrdersOrderReq payload,
    // PostOrdersIdQueryParameters? queryParameters,
  }) async {
    try {
      final result = await _ordersRepository.update(id, payload);
      return Success(result.order);
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
