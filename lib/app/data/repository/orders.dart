import 'dart:developer';


import '../models/res/orders.dart';
import 'base.dart';

class OrdersRepository extends BaseRepository {
  OrdersRepository(super.client);

  /// @description Retrieves an order
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<UserOrderRes?>}
  Future<UserOrderRes?> retrieve({required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get('/admin/orders/$id');
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
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/admin/orders',
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
