import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_sales_channel_req.dart';
import '../../models/res/sales_channel.dart';

abstract class BaseSalesChannel {
  /// Retrieves a list of sales channels
  Future<Either<UserSalesChannelRetrieveAllRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Retrieves the sales channel.
  Future<Either<UserSalesChannelRetrieveRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Updates a Sales Channel.
  Future<Either<UserSalesChannelUpdateRes, Failure>> update(
      {required String id,
      required UserSalesChannelUpdateReq userSalesChannelUpdateRes,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Deletes the sales channel.
  Future<Either<UserSalesChannelDeleteRes, Failure>> delete(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});
}
