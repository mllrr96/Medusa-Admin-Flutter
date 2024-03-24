import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersUseCase {
  static OrdersUseCase get instance => getIt<OrdersUseCase>();
  OrdersRepository get  _orderRepository => getIt<MedusaAdmin>().orderRepository;

  Future<Result<UserRetrieveOrdersRes, Failure>> retrieveOrders(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final orderRepository = _orderRepository;
      final result = await orderRepository.retrieveOrders(
          queryParameters: queryParameters);
      if (result?.orders == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result!);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> updateOrder(
      {required String id,
      required UserUpdateOrderReq userUpdateOrderReq,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final orderRepository = _orderRepository;
      final result = await orderRepository.updateOrder(
        id: id,
        userUpdateOrderReq: userUpdateOrderReq,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
