import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/payment.dart';

abstract class BasePayment {
  Future<Result<UserPaymentRes, Failure>> capturePayment({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserPaymentRes, Failure>> retrievePaymentDetails({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserCreateRefundPaymentRes, Failure>> createRefund({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
