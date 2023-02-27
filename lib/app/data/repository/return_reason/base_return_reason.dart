import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_return_reason.dart';
import 'package:medusa_admin/app/data/models/res/return_reason.dart';

abstract class BaseReturnReason {
  /// Creates a Return Reason
  Future<Either<UserCreateReturnReasonRes, Failure>> create(
      {required UserCreateReturnReasonReq userCreateReturnReasonReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Updates a Return Reason
  Future<Either<UserUpdateReturnReasonRes, Failure>> update(
      {required UserUpdateReturnReasonReq userUpdateReturnReasonReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Retrieves a Return Reason.
  Future<Either<UserRetrieveReturnReasonRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Retrieves a Return Reason.
  Future<Either<UserRetrieveAllReturnReasonRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Deletes a return reason.
  Future<Either<UserDeleteReturnReasonRes, Failure>> delete(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});
}
