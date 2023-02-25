import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_post_auth_req.dart';
import 'package:dartz/dartz.dart';

import '../../models/res/auth.dart';

abstract class BaseAuth {

  Future<Either<UserAuthRes, Failure>> signIn({required UserPostAuthReq req, Map<String, dynamic>? customHeaders});
  Future<bool> signOut({Map<String, dynamic>? customHeaders});
  Future<UserAuthRes?> getSession({Map<String, dynamic>? customHeaders});
}
