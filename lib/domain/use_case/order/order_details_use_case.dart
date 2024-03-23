import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrderCrudUseCase {
  static OrderCrudUseCase get instance => getIt<OrderCrudUseCase>();

  OrdersRepository get _orderRepository => getIt<MedusaAdmin>().orderRepository;
  OrderEditRepository get _orderEditRepository =>
      getIt<MedusaAdmin>().orderEditRepository;
  NotificationRepository get _notificationRepository =>
      getIt<MedusaAdmin>().notificationRepository;
  UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;
  FulfillmentRepository get _fulfillmentRepository =>
      getIt<MedusaAdmin>().fulfillmentRepository;

  Future<Result<Order, Failure>> retrieveOrder({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderRepository.retrieveOrder(
        id: id,
        queryParameters: queryParameters,
      );
      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveAllOrderEditRes, Failure>> retrieveAllOrderEdit({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderEditRepository.retrieveAllOrderEdit(
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> cancelOrderEdit({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderEditRepository.cancelOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<OrderEdit, Failure>> confirmOrderEdit({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _orderEditRepository.confirmOrderEdit(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> createFulfillment({
    required String id,
    required UserCreateFulfillmentReq userCreateFulfillmentReq,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _fulfillmentRepository.createFulfillment(
          id: id, userCreateFulfillmentReq: userCreateFulfillmentReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveNotificationsRes, Failure>> retrieveNotifications({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _notificationRepository.retrieveNotifications(
        queryParameters: queryParameters,
      );
      if (result?.notifications == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result!);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> cancelOrder({
    required String id,
  }) async {
    try {
      final result = await _orderRepository.cancelOrder(
        id: id,
      );
      if (result == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<User, Failure>> retrieveUser({
    required String id,
  }) async {
    try {
      final response = await _userRepository.retrieve(id: id);
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> updateOrder(
      {required String id,
      required UserUpdateOrderReq userUpdateOrderReq}) async {
    try {
      final response = await _orderRepository.updateOrder(
          id: id, userUpdateOrderReq: userUpdateOrderReq);
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> createOrderShipment({
    required String id,
    required String fulfillmentId,
    List<String>? trackingNumbers,
  }) async {
    try {
      final response = await _orderRepository.createOrderShipment(
          id: id,
          fulfillmentId: fulfillmentId,
          trackingNumbers: trackingNumbers);
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> createRefund({
    required String id,
    required UserCreateRefundOrdersReq userCreateRefundOrdersReq,
  }) async {
    try {
      final response = await _orderRepository.createRefund(
        id: id,
        userCreateRefundOrdersReq: userCreateRefundOrdersReq,
      );
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> captureOrderPayment({
    required String id,
  }) async {
    try {
      final response = await _orderRepository.captureOrderPayment(
        id: id,
      );
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Order, Failure>> cancelFulfillment({
    required String id,
    required String fulfillmentId,
  }) async {
    try {
      final response = await _fulfillmentRepository.cancelFulfillment(
        id: id,
        fulfillmentId: fulfillmentId,
      );
      if (response != null) {
        return Success(response);
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
