import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/req/user_order_edit.dart';
import '../../models/res/order_edit.dart';

abstract class BaseOrderEdit {
  Future<Result<UserAddLineItemRes, Failure>> addLineItem({
    required String id,
    required UserAddLineItemReq userAddLineItemReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteLineItemRes, Failure>> deleteLineItem({
    required String id,
    required String itemId,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserUpsertLineItemChangeRes, Failure>> upsertLineItemChange({
    required String id,
    required String itemId,
    required int quantity,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteLineItemChangeRes, Failure>> deleteLineItemChange({
    required String id,
    required String changeId,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserCancelOrderEditRes, Failure>> cancelOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserConfirmOrderEditRes, Failure>> confirmOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserCreateOrderEditRes, Failure>> createOrderEdit({
    required String id,
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteOrderEditRes, Failure>> deleteOrderEdit({
    required String id,
    String? internalNote,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveAllOrderEditRes, Failure>> retrieveAllOrderEdit({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRetrieveOrderEditRes, Failure>> retrieveOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserUpdateOrderEditRes, Failure>> updateOrderEdit({
    required String id,
    String? internalNote,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserUpdateOrderEditRes, Failure>> requestOrderEdit({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
