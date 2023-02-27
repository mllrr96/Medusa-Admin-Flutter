import 'package:dartz/dartz.dart';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import 'package:medusa_admin/app/data/models/req/user_return_reason.dart';

import 'package:medusa_admin/app/data/models/res/return_reason.dart';

import 'base_return_reason.dart';

class ReturnReasonRepo extends BaseReturnReason {
  @override
  Future<Either<UserCreateReturnReasonRes, Failure>> create({required UserCreateReturnReasonReq userCreateReturnReasonReq, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<UserDeleteReturnReasonRes, Failure>> delete({required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRetrieveReturnReasonRes, Failure>> retrieve({required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRetrieveAllReturnReasonRes, Failure>> retrieveAll({Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveAll
    throw UnimplementedError();
  }

  @override
  Future<Either<UserUpdateReturnReasonRes, Failure>> update({required UserUpdateReturnReasonReq userUpdateReturnReasonReq, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}
