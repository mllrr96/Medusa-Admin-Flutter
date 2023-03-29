import 'package:medusa_admin/app/data/models/req/user_order.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_return_req.dart';
import '../../models/res/orders.dart';
import '../../models/res/return.dart';

abstract class BaseReturn {
  /// Requests a Return. If applicable a return label will be created and other plugins notified.
  Future<Result<UserRequestReturnOrderRes, Failure>> requestReturn({
    /// The ID of the Order.
    required String id,
    required UserRequestReturnOrdersReq userRequestReturnOrdersReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Registers a Return as canceled.
  Future<Result<UserCancelReturnOrderRes, Failure>> cancelReturn({
    /// The ID of the Order.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Registers a Return as received. Updates statuses on Orders and Swaps accordingly.
  Future<Result<UserReceiveReturnOrderRes, Failure>> receiveReturn({
    /// The ID of the Order.
    required String id,
    required UserReceiveReturnOrderReq userReceiveReturnOrderReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
  /// Retrieves a list of Returns
  Future<Result<UserRetrieveReturnsRes, Failure>> retrieveReturns({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
