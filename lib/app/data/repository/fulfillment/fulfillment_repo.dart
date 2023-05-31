import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_fulfillment_req.dart';
import 'package:medusa_admin/app/data/models/res/fulfillment.dart';
import 'package:medusa_admin/app/data/repository/fulfillment/base_fulfillment.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class FulfillmentRepo extends BaseFulfillment {
  final _dataProvider = DioClient(dio: Dio());

  /// Registers a claim's fulfillment as canceled.
  @override
  Future<Result<UserFulfillmentRes, Failure>> cancelClaimFulfillment({
    /// The ID of the Order which the Claim relates to.
    required String id,

    /// The ID of the Claim which the Fulfillment relates to.
    required String claimId,

    /// The ID of the Fulfillment
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/claims/$claimId/fulfillments/$fulfillmentId/cancel',
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers a Fulfillment as canceled.
  @override
  Future<Result<UserFulfillmentRes, Failure>> cancelFulfillment({
    /// The ID of the Order which the Fulfillment relates to.
    required String id,

    /// The ID of the Fulfillment
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/fulfillments/$fulfillmentId/cancel',
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Registers a claim's fulfillment as canceled.
  @override
  Future<Result<UserFulfillmentRes, Failure>> cancelSwapFulfillment({
    /// The ID of the Order which the Claim relates to.
    required String id,

    /// The ID of the Swap which the Fulfillment relates to.
    required String swapId,

    /// The ID of the Fulfillment
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/swaps/$swapId/fulfillments/$fulfillmentId/cancel',
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Fulfillment for a Claim.
  @override
  Future<Result<UserFulfillmentRes, Failure>> createClaimFulfillment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Claim.
    required String claimId,

    /// An optional set of key-value pairs to hold additional information.
    Map<String, dynamic>? metadata,

    /// If set to true no notification will be send related to this Claim.
    bool? noNotification,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/claims/$claimId/fulfillments',
        data: {
          if (metadata != null) 'metadata': metadata,
          if (noNotification != null) 'no_notification': noNotification,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Fulfillment of an Order - will notify Fulfillment Providers to prepare a shipment.
  @override
  Future<Result<UserFulfillmentRes, Failure>> createFulfillment({
    /// The ID of the Order.
    required String id,
    required UserCreateFulfillmentReq userCreateFulfillmentReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/fulfillment',
        data: userCreateFulfillmentReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates a Fulfillment for a Swap.
  @override
  Future<Result<UserFulfillmentRes, Failure>> createSwapFulfillment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Swap.
    required String swapId,

    /// An optional set of key-value pairs to hold additional information.
    Map<String, dynamic>? metadata,

    /// If set to true no notification will be send related to this Claim.
    bool? noNotification,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/orders/$id/swaps/$swapId/fulfillments',
        data: {
          if (metadata != null) 'metadata': metadata,
          if (noNotification != null) 'no_notification': noNotification,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserFulfillmentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
