import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/discount.dart';
import 'package:medusa_admin/app/data/models/res/discount.dart';
import 'package:multiple_result/multiple_result.dart';

import 'base_discount.dart';

class DiscountRepo extends BaseDiscount {
  @override
  Future<Result<UserAddRegionDiscountRes, Failure>> addRegion(
      {required String id, required String regionId, Map<String, dynamic>? customHeaders}) {
    // TODO: implement addRegion
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateDiscountRes, Failure>> createDiscount(
      {required UserCreateDiscountReq userCreateDiscountReq,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) {
    // TODO: implement createDiscount
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateDynamicCodeDiscountRes, Failure>> createDynamicCode(
      {required String id,
      required UserCreateDynamicCodeDiscountReq userCreateDynamicCodeDiscountReq,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) {
    // TODO: implement createDynamicCode
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateDiscountRes, Failure>> deleteDiscount(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteDiscount
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteDynamicCodeDiscountRes, Failure>> deleteDynamicCode(
      {required String id,
      required String dynamicCode,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) {
    // TODO: implement deleteDynamicCode
    throw UnimplementedError();
  }

  @override
  Future<Result<UserGetDiscountByCodeRes, Failure>> getDiscountByCode(
      {required String code, Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement getDiscountByCode
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRemoveRegionDiscountRes, Failure>> removeRegion(
      {required String id, required String regionId, Map<String, dynamic>? customHeaders}) {
    // TODO: implement removeRegion
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveDiscountRes, Failure>> retrieveDiscount(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveDiscount
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveDiscountsRes, Failure>> retrieveDiscounts(
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveDiscounts
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateConditionDiscountRes, Failure>> updateCondition(
      {required String discountId,
      required String conditionId,
      required UserUpdateConditionDiscountReq userUpdateConditionDiscountReq,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) {
    // TODO: implement updateCondition
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateDiscountRes, Failure>> updateDiscount(
      {required String id,
      required UserUpdateDiscountReq userUpdateDiscountReq,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) {
    // TODO: implement updateDiscount
    throw UnimplementedError();
  }
}
