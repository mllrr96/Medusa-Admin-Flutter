import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/payment.dart';
import 'package:medusa_admin/app/data/repository/payment/base_payment.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';

class PaymentRepo extends BasePayment {
  final _dataProvider = DioService.instance.dio;

  /// Captures a Payment.
  @override
  Future<Result<UserPaymentRes, Failure>> capturePayment({
    /// The ID of the Payment.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/payments/$id/capture',
      );
      if (response.statusCode == 200) {
        return Success(UserPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Issues a Refund.
  @override
  Future<Result<UserCreateRefundPaymentRes, Failure>> createRefund({
    /// The ID of the Payment.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/payments/$id/capture',
      );
      if (response.statusCode == 200) {
        return Success(UserCreateRefundPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves the Payment details
  @override
  Future<Result<UserPaymentRes, Failure>> retrievePaymentDetails({
    /// The ID of the Payment.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/payments/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserPaymentRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
