import 'package:medusa_admin/app/data/models/res/shipping_option_res.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_shipping_option_req.dart';

abstract class BaseShippingOptions {
  /// Creates a Shipping Option
  Future<Result<UserCreateShippingOptionRes, Failure>> create({
    required UserCreateShippingOptionReq userCreateShippingOptionReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Shipping Option
  Future<Result<UserUpdateShippingOptionRes, Failure>> update(
      {required String id,
      required UserUpdateShippingOptionReq userUpdateReturnReasonReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders});

  /// Retrieves a Shipping Option.
  Future<Result<UserRetrieveShippingOptionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Retrieves a list of Shipping Options.
  Future<Result<UserRetrieveAllShippingOptionRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders});

  /// Deletes a Shipping Option.
  Future<Result<UserDeleteShippingOptionRes, Failure>> delete({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
