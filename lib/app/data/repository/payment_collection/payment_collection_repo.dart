import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/notification.dart';
import 'package:medusa_admin/app/data/models/res/payment_collection.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_payment_collection.dart';import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';

class PaymentCollectionRepo extends BasePaymentCollection {
  final _dataProvider = DioClient(dio: Dio());

  /// Deletes a Payment Collection
  @override
  Future<Result<UserDeletePaymentCollectionRes, Failure>> deletePaymentCollection({
    /// The ID of the PaymentCollection to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/payment-collections/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeletePaymentCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Sets the status of PaymentCollection as Authorized.
  @override
  Future<Result<UserRetrieveNotificationsRes, Failure>> markPaymentCollectionAuthorized({
    /// The ID of the PaymentCollection.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/payment-collections/$id/authorize',
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveNotificationsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a PaymentCollection.
  @override
  Future<Result<UserRetrievePaymentCollectionRes, Failure>> retrievePaymentCollection({
    /// The ID of the PaymentCollection.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/payment-collections/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrievePaymentCollectionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a PaymentCollection.
  @override
  Future<Result<UserRetrieveNotificationsRes, Failure>> updatePaymentCollection({
    /// The ID of the PaymentCollection.
    required String id,

    /// An optional description to create or update the payment collection.
    String? description,

    /// An optional set of key-value pairs to hold additional information.
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/payment-collections/$id', data: {
        if (metadata != null) 'metadata': metadata,
        if (description != null) 'description': description,
      });
      if (response.statusCode == 200) {
        return Success(UserRetrieveNotificationsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
