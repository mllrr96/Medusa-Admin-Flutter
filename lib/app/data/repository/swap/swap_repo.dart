import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_swap_req.dart';
import 'package:medusa_admin/app/data/models/res/swap.dart';
import 'package:medusa_admin/app/data/repository/swap/base_swap.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class SwapRepo extends BaseSwap {
  final _dataProvider = DioClient(dio: Dio());

  /// Cancels a Swap
  @override
  Future<Result<UserCancelSwapRes, Failure>> cancelSwap({
    /// The ID of the Order.
    required String id,

    /// The ID of the Swap to cancel.
    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/swaps/$swapId/cancel',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserCancelSwapRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Swap.
  ///
  /// Swaps are used to handle Return of previously purchased goods and Fulfillment of replacements simultaneously.
  @override
  Future<Result<UserCreateSwapSwapRes, Failure>> createSwap({
    /// The ID of the Order.
    required String id,
    required UserCreateSwapSwapReq userCreateSwapSwapReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/order/$id/swaps',
        data: userCreateSwapSwapReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateSwapSwapRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers a Swap Fulfillment as shipped.
  @override
  Future<Result<UserCreateSwapShipmentSwapRes, Failure>> createSwapShipment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Swap.
    required String swapId,
    required UserCreateSwapShipmentSwapReq userCreateSwapShipmentSwapReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/swaps/$swapId/shipments',
        data: userCreateSwapShipmentSwapReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserCreateSwapShipmentSwapRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// When there are differences between the returned and shipped Products in a Swap, the difference must be processed.
  /// Either a Refund will be issued or a Payment will be captured.
  @override
  Future<Result<UserProcessSwapPaymentRes, Failure>> processSwapPayment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Swap.
    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/swaps/$swapId/process-payment',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserProcessSwapPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Swap.
  @override
  Future<Result<UserRetrieveSwapRes, Failure>> retrieveSwap({
    /// The ID of the Swap.
    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/swaps/$swapId',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveSwapRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Swaps.
  @override
  Future<Result<UserRetrieveSwapsRes, Failure>> retrieveSwaps({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/swaps',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveSwapsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
