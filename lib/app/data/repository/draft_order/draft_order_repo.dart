import 'dart:developer';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_draft_order_req.dart';
import 'package:medusa_admin/app/data/models/res/draft_order.dart';
import 'package:medusa_admin/app/data/repository/draft_order/base_draft_order.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../service/dio_service.dart';

class DraftOrderRepo extends BaseDraftOrder {
  final _dataProvider = DioService.instance.dio;

  /// Creates a Draft Order
  @override
  Future<Result<UserDraftOrderRes, Failure>> createDraftOrder({
    required UserCreateDraftOrderReq userCreateDraftOrderReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/draft-orders', data: userCreateDraftOrderReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Line Item for the Draft Order
  @override
  Future<Result<UserDraftOrderRes, Failure>> createLineItem({
    /// The ID of the Draft Order.
    required String id,
    required UserCreateLineItemReq userCreateLineItemReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response =
          await _dataProvider.post(uri: '/draft-orders/$id/line-items', data: userCreateLineItemReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Draft Order
  @override
  Future<Result<UserDeleteDraftOrderRes, Failure>> deleteDraftOrder({
    /// The ID of the Draft Order to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/draft-orders/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Removes a Line Item from a Draft Order.
  @override
  Future<Result<UserDraftOrderRes, Failure>> deleteLineItem({
    /// The ID of the Draft Order.
    required String id,

    /// The ID of the Line Item.
    required String lineId,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/draft-orders/$id/line-items/$lineId',
      );
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers a payment for a Draft Order.
  @override
  Future<Result<UserRegisterPaymentRes, Failure>> registerPayment({
    /// The ID of the Draft Order.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/draft-orders/$id/pay',
      );
      if (response.statusCode == 200) {
        return Success(UserRegisterPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Draft Order.
  @override
  Future<Result<UserDraftOrderRes, Failure>> retrieveDraftOrder({
    /// The ID of the Draft Order.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/draft-orders/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves an list of Draft Orders
  @override
  Future<Result<UserDraftOrdersRes, Failure>> retrieveDraftOrders({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/draft-orders',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDraftOrdersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Draft Order
  @override
  Future<Result<UserDraftOrderRes, Failure>> updateDraftOrder({
    /// The ID of the Draft Order.
    required String id,
    required UserUpdateDraftOrderReq userUpdateDraftOrderReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/draft-orders/$id',
        data: userUpdateDraftOrderReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Line Item for a Draft Order
  @override
  Future<Result<UserDraftOrderRes, Failure>> updateLineItem({
    /// The ID of the Draft Order.
    required String id,

    /// The ID of the Line Item.
    required String lineId,
    required UserUpdateLineItemReq userUpdateLineItemReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/draft-orders/$id/line-items/$lineId',
        data: userUpdateLineItemReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserDraftOrderRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
