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
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Archives the order with the given id.
  Future<Result<UserArchiveOrderRes, Failure>> archiveOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Registers an Order as canceled. This triggers a flow that will cancel any created Fulfillments and Payments, may fail if the Payment or Fulfillment Provider is unable to cancel the Payment/Fulfillment.
  Future<Result<UserCancelOrderRes, Failure>> cancelOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Captures all the Payments associated with an Order.
  Future<Result<UserCaptureOrderPaymentRes, Failure>> captureOrderPayment({
    /// The ID of the Order.
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

  /// Registers a Fulfillment as shipped.
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
  });

  /// Completes an Order
  Future<Result<UserCompleteOrderRes, Failure>> completeOrder({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Adds a Shipping Method to an Order. If another Shipping Method exists with the same Shipping Profile, the previous Shipping Method will be replaced.
  Future<Result<UserAddShippingMethodOrderRes, Failure>> addShippingMethod({
    /// The ID of the Order.
    required String id,

    /// The ID of the Shipping Option to create the Shipping Method from.
    required String optionId,

    /// The price (excluding VAT) that should be charged for the Shipping Method
    required int price,

    /// The data required for the Shipping Option to create a Shipping Method. This will depend on the Fulfillment Provider.
    dynamic data,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRetrieveOrdersRes, Failure>> retrieveOrders({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserCreateRefundOrdersRes, Failure>> createRefund({
    /// The ID of the Order.
    required String id,
    required UserCreateRefundOrdersReq userCreateRefundOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRequestReturnOrdersRes, Failure>> requestReturn({
    /// The ID of the Order.
    required String id,
    required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
