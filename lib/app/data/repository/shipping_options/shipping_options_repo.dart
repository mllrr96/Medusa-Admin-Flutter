import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_shipping_option_req.dart';
import 'package:medusa_admin/app/data/models/res/shipping_option_res.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/base_shipping_options.dart';
import 'package:multiple_result/src/result.dart';

class ShippingOptionsRepo extends BaseShippingOptions{
  @override
  Future<Result<UserCreateShippingOptionRes, Failure>> create({required UserCreateShippingOptionReq userCreateShippingOptionReq, Map<String, dynamic>? customHeaders}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteShippingOptionRes, Failure>> delete({required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveShippingOptionRes, Failure>> retrieve({required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveAllShippingOptionRes, Failure>> retrieveAll({Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveAll
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateShippingOptionRes, Failure>> update({required String id, required UserUpdateShippingOptionReq userUpdateReturnReasonReq, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}