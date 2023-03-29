import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_swap_req.dart';
import '../../models/res/swap.dart';

abstract class BaseSwap {
  Future<Result<UserCancelSwapRes, Failure>> cancelSwap({
    required String id,

    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserCreateSwapShipmentSwapRes, Failure>> createSwapShipment({
    required String id,

    required String swapId,
    required  UserCreateSwapShipmentSwapReq userCreateSwapShipmentSwapReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });


  Future<Result<UserCreateSwapSwapRes, Failure>> createSwap({
    required String id,
    required UserCreateSwapSwapReq userCreateSwapSwapReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });


  Future<Result<UserProcessSwapPaymentRes, Failure>> processSwapPayment({
    required String id,

    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveSwapRes, Failure>> retrieveSwap({
    required String swapId,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveSwapsRes, Failure>> retrieveSwaps({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
