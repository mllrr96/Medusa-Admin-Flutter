import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/repository/order/base_orders.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/res/orders.dart';
import '../../service/storage_service.dart';

class OrdersRepository extends BaseOrders {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  /// @description Retrieves an order
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<UserOrderRes?>}
  Future<UserOrderRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/orders/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return UserOrderRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a list of Orders
  /// @param queryParameters
  /// @param customHeaders
  /// @return {ResponsePromise<UserOrdersRes?>}
  Future<UserOrdersRes?> retrieveOrders(
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
        return UserOrdersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
