import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_post_auth_req.dart';

import '../../models/res/auth.dart';

abstract class BaseAuth {

  Future<Result<UserAuthRes, Failure>> signIn({required UserPostAuthReq req, Map<String, dynamic>? customHeaders});
  Future<bool> signOut({Map<String, dynamic>? customHeaders});
  Future<Result<UserAuthRes, Failure>> getSession({Map<String, dynamic>? customHeaders});
}
