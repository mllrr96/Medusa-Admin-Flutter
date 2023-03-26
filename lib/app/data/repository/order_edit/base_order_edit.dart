import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/req/user_order_edit.dart';
import '../../models/res/order_edit.dart';

abstract class BaseOrderEdit {
  /// Create an OrderEdit LineItem
  Future<Result<UserAddLineItemRes, Failure>> addLineItem({
    /// The ID of the Order Edit.
    required String id,
    required UserAddLineItemReq userAddLineItemReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Delete line items from an order edit and create change item
  Future<Result<UserDeleteLineItemRes, Failure>> deleteLineItem({
    /// The ID of the Order Edit to delete from.
    required String id,

    /// The ID of the order edit item to delete from order.
    required String itemId,
    Map<String, dynamic>? customHeaders,
  });

  /// Create or update the order edit change holding the line item changes
  Future<Result<UserUpsertLineItemChangeRes, Failure>> upsertLineItemChange({
    /// The ID of the Order Edit to update.
    required String id,

    /// The ID of the order edit item to update.
    required String itemId,

    /// The quantity to update
    required int quantity,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes an Order Edit Item Change
  Future<Result<UserDeleteLineItemChangeRes, Failure>> deleteLineItemChange({
    /// The ID of the Order Edit to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Cancels an OrderEdit.
  Future<Result<UserCancelOrderEditRes, Failure>> cancelOrderEdit({
    /// The ID of the Order Edit.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Confirms an OrderEdit.
  Future<Result<UserConfirmOrderEditRes, Failure>> confirmOrderEdit({
    /// The ID of the Order Edit.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates an OrderEdit.
  Future<Result<UserCreateOrderEditRes, Failure>> createOrderEdit({
    /// The ID of the order to create the edit for.
    required String id,

    /// An optional note to create for the order edit.
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes an OrderEdit.
  Future<Result<UserDeleteOrderEditRes, Failure>> deleteOrderEdit({
    /// The ID of the order to create the edit for.
    required String id,

    /// An optional note to create for the order edit.
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  });

  /// List OrderEdits.
  Future<Result<UserRetrieveAllOrderEditRes, Failure>> retrieveAllOrderEdit({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieves an OrderEdit.
  Future<Result<UserRetrieveOrderEditRes, Failure>> retrieveOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Updates an OrderEdit.
  Future<Result<UserUpdateOrderEditRes, Failure>> updateOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Request customer confirmation of an Order Edit
  Future<Result<UserUpdateOrderEditRes, Failure>> requestOrderEdit({
    /// The ID of the Order Edit to request confirmation from.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
