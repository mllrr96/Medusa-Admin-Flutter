import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/repository/orders_repository.dart';
import 'package:medusa_api_client/gen.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersUseCase {
  OrdersUseCase(this._ordersRepository);

  final OrdersRepository _ordersRepository;

  static OrdersUseCase get instance => getIt<OrdersUseCase>();

  Future<Result<AdminOrderListResponse, Failure>> retrieveOrders(
      {GetOrdersQueryParameters? queryParameters}) async {
    try {
      final result =
          await _ordersRepository.listOrders(queryParameters: queryParameters);
      return Success(result);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<AdminOrder, Failure>> updateOrder(
      {required String id,
      required AdminUpdateOrder payload,
      PostOrdersIdQueryParameters? queryParameters}) async {
    try {
      final result = await _ordersRepository.updateOrder(
        id: id,
        requestBody: payload,
        query: queryParameters,
      );
      return Success(result.order);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
