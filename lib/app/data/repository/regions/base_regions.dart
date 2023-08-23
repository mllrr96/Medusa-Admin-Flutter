import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_region_req.dart';
import '../../models/res/regions.dart';

abstract class BaseRegions {
  /// Retrieves a list of Regions.
  Future<Result<UserRegionsRes, Failure>> retrieveAll({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Adds a Country to the list of Countries in a Region
  Future<Result<UserRegionsRes, Failure>> addCountryToRegion({
    /// The ID of the Region.
    required String id,

    /// The 2 character ISO code for the Country.
    required String countryCode,
    Map<String, dynamic>? customHeaders,
  });

  /// Removes a Country from the list of Countries in a Region
  Future<Result<UserRegionsRes, Failure>> removeCountryFromRegion({
    /// The ID of the Region.
    required String id,

    /// The 2 character ISO code for the Country.
    required String countryCode,
    Map<String, dynamic>? customHeaders,
  });

  /// Adds a Fulfillment Provider to a Region
  Future<Result<UserRegionsRes, Failure>> addFulfillmentProvider({
    /// The ID of the Region.
    required String id,

    /// The ID of the Fulfillment Provider to add.
    required String providerId,
    Map<String, dynamic>? customHeaders,
  });

  /// Adds a Fulfillment Provider to a Region
  Future<Result<UserRegionsRes, Failure>> deleteFulfillmentProvider({
    /// The ID of the Region.
    required String id,

    /// The ID of the Fulfillment Provider to delete.
    required String providerId,
    Map<String, dynamic>? customHeaders,
  });

  /// Adds a Payment Provider to a Region
  Future<Result<UserRegionsRes, Failure>> addPaymentProvider({
    /// The ID of the Region.
    required String id,

    /// The ID of the Payment Provider to add.
    required String providerId,
    Map<String, dynamic>? customHeaders,
  });

  /// Adds a Payment Provider to a Region
  Future<Result<UserRegionsRes, Failure>> deletePaymentProvider({
    /// The ID of the Region.
    required String id,

    /// The ID of the Payment Provider to delete.
    required String providerId,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Region.
  Future<Result<UserRegionRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Region.
  Future<Result<UserRegionRes, Failure>> update({
    required String id,
    required UserUpdateRegionReq userUpdateRegionReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Region
  Future<Result<UserRegionRes, Failure>> create({
    required UserCreateRegionReq userCreateRegionReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a Region
  Future<Result<UserDeleteRegionRes, Failure>> delete({
    /// The ID of the Region.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Gathers all the fulfillment options available to in the Region.
  Future<Result<UserRetrieveFulfillmentOptionsRes, Failure>> retrieveFulfillmentOptions({
    /// The ID of the Region.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
