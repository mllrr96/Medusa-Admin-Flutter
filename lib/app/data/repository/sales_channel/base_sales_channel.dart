import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_sales_channel_req.dart';
import '../../models/res/sales_channel.dart';

abstract class BaseSalesChannel {
  /// Retrieves a list of sales channels
  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Retrieves the sales channel.
  Future<Result<UserSalesChannelRetrieveRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Updates a Sales Channel.
  Future<Result<UserSalesChannelUpdateRes, Failure>> update(
      {required String id,
      required UserSalesChannelUpdateReq userSalesChannelUpdateRes,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Deletes the sales channel.
  Future<Result<UserSalesChannelDeleteRes, Failure>> delete(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});
}
