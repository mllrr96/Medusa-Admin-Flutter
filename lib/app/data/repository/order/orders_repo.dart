import 'dart:developer';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_order.dart';
import 'package:medusa_admin/app/data/repository/order/base_orders.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../models/res/orders.dart';
import 'package:medusa_admin/app/data/service/dio_service.dart';

class OrdersRepo extends BaseOrders {
  final _dataProvider = DioService.instance.dio;

  /// Retrieves an order
  @override
  Future<Result<UserRetrieveOrderRes, Failure>> retrieveOrder(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/orders/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(UserRetrieveOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Orders
  @override
  Future<Result<UserRetrieveOrdersRes, Failure>> retrieveOrders(
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
        return Success(UserRetrieveOrdersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Adds a Shipping Method to an Order. If another Shipping Method exists with the same Shipping Profile,
  /// the previous Shipping Method will be replaced.
  @override
  Future<Result<UserAddShippingMethodOrderRes, Failure>> addShippingMethod({
    /// The ID of the Order.
    required String id,

    /// The ID of the Shipping Option to create the Shipping Method from.
    required String optionId,

    /// The price (excluding VAT) that should be charged for the Shipping Method
    required int price,

    /// The data required for the Shipping Option to create a Shipping Method. This will depend on the Fulfillment Provider.
    data,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/shipping-methods',
        data: {
          'price': price,
          'option_id': optionId,
          if (data != null) 'data': data,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserAddShippingMethodOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Archives the order with the given id.
  @override
  Future<Result<UserArchiveOrderRes, Failure>> archiveOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/archive',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserArchiveOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers an Order as canceled. This triggers a flow that will cancel any created Fulfillments and Payments,
  /// may fail if the Payment or Fulfillment Provider is unable to cancel the Payment/Fulfillment.
  @override
  Future<Result<UserCancelOrderRes, Failure>> cancelOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/cancel',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCancelOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Captures all the Payments associated with an Order.
  @override
  Future<Result<UserCaptureOrderPaymentRes, Failure>> captureOrderPayment({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/capture',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCaptureOrderPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Completes an Order
  @override
  Future<Result<UserCompleteOrderRes, Failure>> completeOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/complete',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCompleteOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers a Fulfillment as shipped.
  @override
  Future<Result<UserCreateOrderShipmentRes, Failure>> createOrderShipment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Fulfillment.
    required String fulfillmentId,

    /// The tracking numbers for the shipment.
    List<String>? trackingNumbers,

    /// If set to true no notification will be send related to this Shipment.
    bool? noNotification,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/shipment',
        data: {
          'fulfillment_id': fulfillmentId,
          if (trackingNumbers != null) 'tracking_numbers': trackingNumbers,
          if (noNotification != null) 'no_notification': noNotification,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateOrderShipmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Issues a Refund.
  @override
  Future<Result<UserCreateRefundOrdersRes, Failure>> createRefund({
    /// The ID of the Order.
    required String id,
    required UserCreateRefundOrdersReq userCreateRefundOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/refund',
        data: userCreateRefundOrdersReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateRefundOrdersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserCreateReservationForLineItemOrderRes, Failure>> createReservationForLineItem({
    required String id,
    required String lineItemId,
    required String locationId,
    int? quantity,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/line-items/$lineItemId/reservations',
        data: {
          'location_id': locationId,
          if (quantity != null) 'quantity': quantity,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateReservationForLineItemOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Requests a Return. If applicable a return label will be created and other plugins notified.
  @override
  Future<Result<UserRequestReturnOrderRes, Failure>> requestReturn({
    /// The ID of the Order.
    required String id,
    required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/return',
        data: userRequestReturnOrdersReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRequestReturnOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves reservations for an Order
  @override
  Future<Result<UserRetrieveOrderReservationsRes, Failure>> retrieveOrderReservations({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/orders/$id/reservations',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveOrderReservationsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserUpdateOrderRes, Failure>> updateOrder({
    required String id,
    required UserUpdateOrderReq userUpdateOrderReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id',
        data: userUpdateOrderReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
