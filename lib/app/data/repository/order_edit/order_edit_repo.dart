import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import 'package:medusa_admin/app/data/models/req/user_order_edit.dart';

import 'package:medusa_admin/app/data/models/res/order_edit.dart';
import 'package:multiple_result/multiple_result.dart';

import 'base_order_edit.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class OrderEditRepo extends BaseOrderEdit {
  final _dataProvider = DioClient(dio: Dio());

  /// Create an OrderEdit LineItem
  @override
  Future<Result<UserAddLineItemRes, Failure>> addLineItem({
    /// The ID of the Order Edit.
    required String id,
    required UserAddLineItemReq userAddLineItemReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id/items',
        data: userAddLineItemReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserAddLineItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Cancels an OrderEdit.
  @override
  Future<Result<UserCancelOrderEditRes, Failure>> cancelOrderEdit({
    /// The ID of the Order Edit.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id/cancel',
      );
      if (response.statusCode == 200) {
        return Success(UserCancelOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Confirms an OrderEdit.
  @override
  Future<Result<UserConfirmOrderEditRes, Failure>> confirmOrderEdit({
    /// The ID of the Order Edit.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id/confirm',
      );
      if (response.statusCode == 200) {
        return Success(UserConfirmOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Creates an OrderEdit.
  @override
  Future<Result<UserCreateOrderEditRes, Failure>> createOrderEdit({
    /// The ID of the order to create the edit for.
    required String id,

    /// An optional note to create for the order edit.
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits',
        data: {
          'order_id': id,
          if (internalNote != null) 'internal_note': internalNote,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserCreateOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Delete line items from an order edit and create change item
  @override
  Future<Result<UserDeleteLineItemRes, Failure>> deleteLineItem({
    /// The ID of the Order Edit to delete from.
    required String id,

    /// The ID of the order edit item to delete from order.
    required String itemId,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/order-edits/$id/items/$itemId',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteLineItemRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Deletes an Order Edit Item Change
  @override
  Future<Result<UserDeleteLineItemChangeRes, Failure>> deleteLineItemChange({
    /// The ID of the Order Edit to delete.
    required String id,
    required String changeId,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/order-edits/$id/changes/$changeId',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteLineItemChangeRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Deletes an OrderEdit.
  @override
  Future<Result<UserDeleteOrderEditRes, Failure>> deleteOrderEdit({
    /// The ID of the order to create the edit for.
    required String id,

    /// An optional note to create for the order edit.
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/order-edits/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Request customer confirmation of an Order Edit
  @override
  Future<Result<UserUpdateOrderEditRes, Failure>> requestOrderEdit({
    /// The ID of the Order Edit to request confirmation from.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id/request',
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// List OrderEdits.
  @override
  Future<Result<UserRetrieveAllOrderEditRes, Failure>> retrieveAllOrderEdit({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/order-edits',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveAllOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Retrieves an OrderEdit.
  @override
  Future<Result<UserRetrieveOrderEditRes, Failure>> retrieveOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/order-edits/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Updates an OrderEdit.
  @override
  Future<Result<UserUpdateOrderEditRes, Failure>> updateOrderEdit({
    required String id,

    /// An optional note to create or update for the order edit.
    String? internalNote,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id',
        data: {
          'internal_note': internalNote,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateOrderEditRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  /// Create or update the order edit change holding the line item changes
  @override
  Future<Result<UserUpsertLineItemChangeRes, Failure>> upsertLineItemChange({
    /// The ID of the Order Edit to update.
    required String id,

    /// The ID of the order edit item to update.
    required String itemId,

    /// The quantity to update
    required int quantity,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/order-edits/$id/items/$itemId',
        data: {
          'quantity': quantity,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserUpsertLineItemChangeRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
