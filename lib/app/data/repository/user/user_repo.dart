import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_create_user_req.dart';
import 'package:medusa_admin/app/data/models/req/user_reset_password_req.dart';
import 'package:medusa_admin/app/data/models/req/user_update_user_req.dart';
import 'package:medusa_admin/app/data/models/res/user.dart';
import 'package:medusa_admin/app/data/repository/user/base_user.dart';

class UserRepo extends BaseUser{
  @override
  Future<Either<UserCreateUserRes, Failure>> createUser({required UserCreateUserReq userCreateUserReq, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserDeleteUserRes, Failure>> deleteUser({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Failure>> requestPasswordReset({required String email, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement requestPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<Either<UserResetPasswordRes, Failure>> resetPassword({required UserResetPasswordReq userResetPasswordReq, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRetrieveUserRes, Failure>> retrieveUser({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRetrieveUserListRes, Failure>> retrieveUserList({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveUserList
    throw UnimplementedError();
  }

  @override
  Future<Either<UserUpdateUserRes, Failure>> update({required String id, required UserUpdateUserReq userUpdateUserReq, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}