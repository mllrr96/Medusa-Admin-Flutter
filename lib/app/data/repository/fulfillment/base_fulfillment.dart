import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_fulfillment_req.dart';
import '../../models/res/fulfillment.dart';

abstract class BaseFulfillment {
  Future<Result<UserFulfillmentRes, Failure>> createFulfillment({
    required String id,
    required UserCreateFulfillmentReq userCreateFulfillmentReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserFulfillmentRes, Failure>> cancelFulfillment({
    required String id,
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserFulfillmentRes, Failure>> createClaimFulfillment({
    required String id,
    required String claimId,
    Map<String, dynamic>? metadata,
    bool? noNotification,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserFulfillmentRes, Failure>> cancelClaimFulfillment({
    required String id,
    required String claimId,
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserFulfillmentRes, Failure>> createSwapFulfillment({
    required String id,
    required String swapId,
    Map<String, dynamic>? metadata,
    bool? noNotification,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserFulfillmentRes, Failure>> cancelSwapFulfillment({
    required String id,
    required String swapId,
    required String fulfillmentId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
