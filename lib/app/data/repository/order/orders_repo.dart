import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/repository/order/base_orders.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/res/orders.dart';
import '../../service/storage_service.dart';

class OrdersRepository extends BaseOrders {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  /// Retrieves an order
  Future<Result<UserOrderRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/orders/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(UserOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Orders
  Future<Result<UserOrdersRes, Failure>> retrieveOrders(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/orders',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserOrdersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
