import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_order.dart';
import 'package:medusa_admin/app/data/repository/order/base_orders.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/res/orders.dart';
import '../../service/storage_service.dart';

class OrdersRepository extends BaseOrders {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

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

  @override
  Future<Result<UserAddShippingMethodOrderRes, Failure>> addShippingMethod(
      {required String id,
      required String optionId,
      required int price,
      data,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement addShippingMethod
    throw UnimplementedError();
  }

  @override
  Future<Result<UserArchiveOrderRes, Failure>> archiveOrder(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement archiveOrder
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCancelOrderRes, Failure>> cancelOrder(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCaptureOrderPaymentRes, Failure>> captureOrderPayment(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement captureOrderPayment
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCompleteOrderRes, Failure>> completeOrder(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement completeOrder
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateOrderShipmentRes, Failure>> createOrderShipment(
      {required String id,
      required String fulfillmentId,
      List<String>? trackingNumbers,
      bool? noNotification,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement createOrderShipment
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateRefundOrdersRes, Failure>> createRefund(
      {required String id,
      required UserCreateRefundOrdersReq userCreateRefundOrdersReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement createRefund
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateReservationForLineItemOrderRes, Failure>> createReservationForLineItem(
      {required String id,
      required String lineItemId,
      required String locationId,
      int? quantity,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement createReservationForLineItem
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRequestReturnOrdersRes, Failure>> requestReturn(
      {required String id,
      required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement requestReturn
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveOrderReservationsRes, Failure>> retrieveOrderReservations(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveOrderReservations
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateOrderRes, Failure>> updateOrder(
      {required String id,
      required UserUpdateOrderReq userUpdateOrderReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }
}
