import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/discount.dart';
import '../../models/res/discount.dart';

abstract class BaseDiscount {
  /// Adds a Region to the list of Regions that a Discount can be used in.
  Future<Result<UserAddRegionDiscountRes, Failure>> addRegion({
    /// The ID of the Discount.
    required String id,

    /// The ID of the Region.
    required String regionId,
    Map<String, dynamic>? customHeaders,
  });

  /// Removes a Region from the list of Regions that a Discount can be used in.
  Future<Result<UserRemoveRegionDiscountRes, Failure>> removeRegion({
    /// The ID of the Discount.
    required String id,

    /// The ID of the Region.
    required String regionId,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a Discount with a given set of rules that define how the Discount behaves.
  Future<Result<UserCreateDiscountRes, Failure>> createDiscount({
    required UserCreateDiscountReq userCreateDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a Discount.
  Future<Result<UserCreateDiscountRes, Failure>> deleteDiscount({
    /// The ID of the Discount.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Discount.
  Future<Result<UserRetrieveDiscountRes, Failure>> retrieveDiscount({
    /// The ID of the Discount
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Discount with a given set of rules that define how the Discount behaves.
  Future<Result<UserUpdateDiscountRes, Failure>> updateDiscount({
    /// The ID of the Discount
    required String id,
    required UserUpdateDiscountReq userUpdateDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a list of Discounts
  Future<Result<UserRetrieveDiscountsRes, Failure>> retrieveDiscounts({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a dynamic unique code that can map to a parent Discount.
  ///
  /// This is useful if you want to automatically generate codes with the same behaviour.
  Future<Result<UserCreateDynamicCodeDiscountRes, Failure>> createDynamicCode({
    /// The ID of the Discount to create the dynamic code from.
    required String id,
    required UserCreateDynamicCodeDiscountReq userCreateDynamicCodeDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Discount by its discount code
  Future<Result<UserGetDiscountByCodeRes, Failure>> getDiscountByCode({
    /// The code of the Discount
    required String code,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a dynamic code from a Discount.
  Future<Result<UserDeleteDynamicCodeDiscountRes, Failure>> deleteDynamicCode({
    /// The ID of the Discount
    required String id,
    required String dynamicCode,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a DiscountCondition.
  ///
  /// Only one of products, product_types, product_collections, product_tags, and customer_groups should be provided.
  Future<Result<UserUpdateConditionDiscountRes, Failure>> updateCondition({
    /// The ID of the Product.
    required String discountId,

    /// The ID of the DiscountCondition.
    required String conditionId,

    /// Only one of products, product_types, product_collections, product_tags, and customer_groups should be provided.
    required UserUpdateConditionDiscountReq userUpdateConditionDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
