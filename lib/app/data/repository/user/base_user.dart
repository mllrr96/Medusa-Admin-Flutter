import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_reset_password_req.dart';
import '../../models/req/user_user_req.dart';
import '../../models/res/user.dart';

abstract class BaseUser {
  /// Updates a User
  Future<Result<UserUpdateUserRes, Failure>> update({
    required String id,
    required UserUpdateUserReq userUpdateUserReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a User.
  Future<Result<UserRetrieveUserRes, Failure>> retrieve({required String id, Map<String, dynamic>? customHeaders});

  /// Creates a User
  Future<Result<UserCreateUserRes, Failure>> create({
    required UserCreateUserReq userCreateUserReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves all users.
  Future<Result<UserRetrieveUserListRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

  /// Generates a password token for a User with a given email.
  Future<Result<bool, Failure>> requestPasswordReset({required String email, Map<String, dynamic>? customHeaders});

  /// Sets the password for a User given the correct token.
  Future<Result<UserResetPasswordRes, Failure>> resetPassword({
    required UserResetPasswordReq userResetPasswordReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Generates a password token for a User with a given email.
  Future<Result<UserDeleteUserRes, Failure>> delete({required String id, Map<String, dynamic>? customHeaders});
}
