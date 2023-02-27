import 'package:dartz/dartz.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_create_user_req.dart';
import '../../models/req/user_reset_password_req.dart';
import '../../models/req/user_update_user_req.dart';
import '../../models/res/user.dart';

abstract class BaseUser {
  /// Updates a User
  Future<Either<UserUpdateUserRes, Failure>> update(
      {required String id,
        required UserUpdateUserReq userUpdateUserReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Retrieves a User.
  Future<Either<UserRetrieveUserRes, Failure>> retrieveUser(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Creates a User
  Future<Either<UserCreateUserRes, Failure>> createUser(
      {required UserCreateUserReq userCreateUserReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Retrieves all users.
  Future<Either<UserRetrieveUserListRes, Failure>> retrieveUserList(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Generates a password token for a User with a given email.
  Future<Either<bool, Failure>> requestPasswordReset(
      {required String email, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Generates a password token for a User with a given email.
  Future<Either<UserResetPasswordRes, Failure>> resetPassword(
      {required UserResetPasswordReq userResetPasswordReq,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters});

  /// Generates a password token for a User with a given email.
  Future<Either<UserDeleteUserRes, Failure>> deleteUser(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});
}
