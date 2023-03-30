import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_draft_order_req.dart';
import '../../models/res/draft_order.dart';

abstract class BaseDraftOrder {
  Future<Result<UserDraftOrderRes, Failure>> createDraftOrder({
    required UserCreateDraftOrderReq userCreateDraftOrderReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrderRes, Failure>> updateDraftOrder({
    required String id,
    required UserUpdateDraftOrderReq userUpdateDraftOrderReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteDraftOrderRes, Failure>> deleteDraftOrder({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrdersRes, Failure>> retrieveDraftOrders({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrderRes, Failure>> retrieveDraftOrder({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrderRes, Failure>> createLineItem({
    required String id,
    required UserCreateLineItemReq userCreateLineItemReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrderRes, Failure>> updateLineItem({
    required String id,
    required String lineId,
    required UserUpdateLineItemReq userUpdateLineItemReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDraftOrderRes, Failure>> deleteLineItem({
    required String id,

    required String lineId,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRegisterPaymentRes, Failure>> registerPayment({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
