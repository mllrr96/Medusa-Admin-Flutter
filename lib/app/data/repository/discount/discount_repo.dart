import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/discount.dart';
import 'package:medusa_admin/app/data/models/res/discount.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';
import 'base_discount.dart';

class DiscountRepo extends BaseDiscount {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserAddRegionDiscountRes, Failure>> addRegion({
    required String id,
    required String regionId,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/discounts/$id/regions/$regionId',
      );
      if (response.statusCode == 200) {
        return Success(UserAddRegionDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCreateDiscountRes, Failure>> createDiscount(
      {required UserCreateDiscountReq userCreateDiscountReq,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? customHeaders}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/discounts',
        data: userCreateDiscountReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserCreateDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCreateDynamicCodeDiscountRes, Failure>> createDynamicCode({
    required String id,
    required UserCreateDynamicCodeDiscountReq userCreateDynamicCodeDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/discounts/$id/dynamic-codes',
        data: userCreateDynamicCodeDiscountReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserCreateDynamicCodeDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserCreateDiscountRes, Failure>> deleteDiscount({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/discounts/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserCreateDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserDeleteDynamicCodeDiscountRes, Failure>> deleteDynamicCode({
    required String id,
    required String dynamicCode,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/discounts/$id/dynamic-codes/$dynamicCode',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteDynamicCodeDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserGetDiscountByCodeRes, Failure>> getDiscountByCode({
    required String code,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/discounts/code/$code',
      );
      if (response.statusCode == 200) {
        return Success(UserGetDiscountByCodeRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRemoveRegionDiscountRes, Failure>> removeRegion({
    required String id,
    required String regionId,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.delete(
        '/discounts/$id/regions/$regionId',
      );
      if (response.statusCode == 200) {
        return Success(UserRemoveRegionDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRetrieveDiscountRes, Failure>> retrieveDiscount({
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/discounts/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserRetrieveDiscountsRes, Failure>> retrieveDiscounts({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/discounts',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveDiscountsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserUpdateConditionDiscountRes, Failure>> updateCondition({
    required String discountId,
    required String conditionId,
    required UserUpdateConditionDiscountReq userUpdateConditionDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/discounts',
        data: userUpdateConditionDiscountReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateConditionDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  @override
  Future<Result<UserUpdateDiscountRes, Failure>> updateDiscount({
    required String id,
    required UserUpdateDiscountReq userUpdateDiscountReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.post(
        uri: '/discounts/$id',
        data: userUpdateDiscountReq.toJson(),
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserUpdateDiscountRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
