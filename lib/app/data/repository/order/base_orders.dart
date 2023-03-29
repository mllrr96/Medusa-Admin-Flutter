import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_order.dart';
import '../../models/res/orders.dart';

abstract class BaseOrders {
  Future<Result<UserRetrieveOrderRes, Failure>> retrieveOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserUpdateOrderRes, Failure>> updateOrder({
    /// The ID of the Order.
    required String id,
    required UserUpdateOrderReq userUpdateOrderReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRetrieveOrderReservationsRes, Failure>> retrieveOrderReservations({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserArchiveOrderRes, Failure>> archiveOrder({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCancelOrderRes, Failure>> cancelOrder({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCaptureOrderPaymentRes, Failure>> captureOrderPayment({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Creates a Reservation for a line item at a specified location, optionally for a partial quantity.
  Future<Result<UserCreateReservationForLineItemOrderRes, Failure>> createReservationForLineItem({
    /// The ID of the Order.
    required String id,

    /// The ID of the Line item.
    required String lineItemId,

    /// The id of the location of the reservation
    required String locationId,

    /// The quantity to reserve
    int? quantity,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCreateOrderShipmentRes, Failure>> createOrderShipment({
    required String id,

    required String fulfillmentId,

    List<String>? trackingNumbers,

    bool? noNotification,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCompleteOrderRes, Failure>> completeOrder({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserAddShippingMethodOrderRes, Failure>> addShippingMethod({
    required String id,
    required String optionId,
    required int price,
    dynamic data,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRetrieveOrdersRes, Failure>> retrieveOrders({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCreateRefundOrdersRes, Failure>> createRefund({
    required String id,
    required UserCreateRefundOrdersReq userCreateRefundOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRequestReturnOrderRes, Failure>> requestReturn({
    required String id,
    required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
