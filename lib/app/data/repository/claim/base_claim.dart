import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_claim.dart';
import '../../models/res/claim.dart';

abstract class BaseClaim {
  /// Cancels an OrderEdit.
  Future<Result<UserCancelClaimRes, Failure>> cancelClaim({
    /// The ID of the Order.
    required String id,

    /// The ID of the Claim.
    required String claimId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Registers a Claim Fulfillment as shipped.
  Future<Result<UserCreateClaimShipmentRes, Failure>> createClaimShipment({
    /// The ID of the Order.
    required String id,

    /// The ID of the Claim.
    required String claimId,
    required UserCreateClaimShipmentReq userCreateClaimShipmentReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Claim.
  Future<Result<UserCreateClaimRes, Failure>> createClaim({
    /// The ID of the Order.
    required String id,
    required UserCreateClaimReq userCreateClaimReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Claim.
  Future<Result<UserUpdateClaimRes, Failure>> updateClaim({
    /// The ID of the Order.
    required String id,

    /// The ID of the Claim.
    required String claimId,
    required UserUpdateClaimReq userUpdateClaimReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
