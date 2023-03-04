import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_return_reason.dart';
import 'package:medusa_admin/app/data/models/res/return_reason.dart';

abstract class BaseReturnReason {
  /// Creates a Return Reason
  Future<Result<UserCreateReturnReasonRes, Failure>> create({
    required UserCreateReturnReasonReq userCreateReturnReasonReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Return Reason
  Future<Result<UserUpdateReturnReasonRes, Failure>> update(
      {required String id,
      required UserUpdateReturnReasonReq userUpdateReturnReasonReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Retrieves a Return Reason.
  Future<Result<UserRetrieveReturnReasonRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Retrieves a Return Reason.
  Future<Result<UserRetrieveAllReturnReasonRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Deletes a return reason.
  Future<Result<UserDeleteReturnReasonRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
