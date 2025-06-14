import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/medusa_client.dart';
import 'package:medusa_api_client/gen.dart';

@lazySingleton
class OrdersRepository {
  OrdersRepository(this._medusaClient);

  final MedusaClient _medusaClient;

  OrdersClient get _ordersRepository => _medusaClient.client.ordersClient;

  Future<AdminOrderListResponse> listOrders({
    GetOrdersQueryParameters? queryParameters,
  }) async {
    final result = await _ordersRepository.getOrders(queries: queryParameters);
    return result.data;
  }

  Future<AdminOrderResponse> updateOrder({
    required String id,
    required AdminUpdateOrder requestBody,
    PostOrdersIdQueryParameters? query,
  }) async {
    final result =
        await _ordersRepository.postOrdersId(requestBody: requestBody, id: id);
    return result.data;
  }
}
