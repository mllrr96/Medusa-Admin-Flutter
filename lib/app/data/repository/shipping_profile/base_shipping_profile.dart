import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_shipping_profile_req.dart';
import '../../models/res/shipping_profile.dart';

abstract class BaseShippingProfile {
  Future<Result<UserCreateShippingProfileRes, Failure>> create({
    required UserCreateShippingProfileReq userCreateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserUpdateShippingProfileRes, Failure>> update({
    required String id,
    required UserUpdateShippingProfileReq userUpdateShippingProfileReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveShippingProfileRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveAllShippingProfileRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteShippingProfileRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
