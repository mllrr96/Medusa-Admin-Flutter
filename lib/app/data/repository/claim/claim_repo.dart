import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_claim.dart';
import 'package:medusa_admin/app/data/models/res/claim.dart';
import 'package:multiple_result/multiple_result.dart';


import 'base_claim.dart';

class ClaimRepo extends BaseClaim{
  @override
  Future<Result<UserCancelClaimRes, Failure>> cancelClaim({required String id, required String claimId, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement cancelClaim
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateClaimRes, Failure>> createClaim({required String id, required UserCreateClaimReq userCreateClaimReq, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement createClaim
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateClaimShipmentRes, Failure>> createClaimShipment({required String id, required String claimId, required UserCreateClaimShipmentReq userCreateClaimShipmentReq, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement createClaimShipment
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateClaimRes, Failure>> updateClaim({required String id, required String claimId, required UserUpdateClaimReq userUpdateClaimReq, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement updateClaim
    throw UnimplementedError();
  }

}