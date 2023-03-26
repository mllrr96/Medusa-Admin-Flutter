import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import 'package:medusa_admin/app/data/models/req/order_edit.dart';

import 'package:medusa_admin/app/data/models/res/order_edit.dart';
import 'package:multiple_result/multiple_result.dart';


import 'base_order_edit.dart';

class OrderEditRepository extends BaseOrderEdit {
  @override
  Future<Result<UserAddLineItemRes, Failure>> addLineItem(
      {required String id, required UserAddLineItemReq userAddLineItemReq, Map<String, dynamic>? customHeaders}) {
    // TODO: implement addLineItem
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCancelOrderEditRes, Failure>> cancelOrderEdit(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement cancelOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserConfirmOrderEditRes, Failure>> confirmOrderEdit(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement confirmOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateOrderEditRes, Failure>> createOrderEdit(
      {required String id, String? internalNote, Map<String, dynamic>? customHeaders}) {
    // TODO: implement createOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteLineItemRes, Failure>> deleteLineItem(
      {required String id, required String itemId, Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteLineItem
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteLineItemChangeRes, Failure>> deleteLineItemChange(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteLineItemChange
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteOrderEditRes, Failure>> deleteOrderEdit(
      {required String id, String? internalNote, Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateOrderEditRes, Failure>> requestOrderEdit(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement requestOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveAllOrderEditRes, Failure>> retrieveAllOrderEdit(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveAllOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveOrderEditRes, Failure>> retrieveOrderEdit(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateOrderEditRes, Failure>> updateOrderEdit(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement updateOrderEdit
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpsertLineItemChangeRes, Failure>> upsertLineItemChange(
      {required String id, required String itemId, required int quantity, Map<String, dynamic>? customHeaders}) {
    // TODO: implement upsertLineItemChange
    throw UnimplementedError();
  }
}
