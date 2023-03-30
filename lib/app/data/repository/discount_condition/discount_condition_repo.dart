import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_discount_condition_req.dart';
import 'package:medusa_admin/app/data/models/res/discount_condition.dart';
import 'package:medusa_admin/app/data/repository/discount_condition/base_discount_condition.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';

class DiscountConditionRepo extends BaseDiscountCondition {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserAddBatchResourcesRes, Failure>> addBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/discounts/$discountId/conditions/$conditionId/batch',
        data: {
          'resources': itemIds,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserAddBatchResourcesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserCreateDiscountConditionRes, Failure>> createDiscountCondition({
    required String discountId,
    required UserCreateConditionReq userCreateConditionReq,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/discounts/$discountId/conditions',
        data: userCreateConditionReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserCreateDiscountConditionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRemoveBatchResourcesRes, Failure>> deleteBatchResources({
    required String discountId,
    required String conditionId,
    required List<String> itemIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/discounts/$discountId/conditions/$conditionId/batch',
        data: {
          'resources': itemIds,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserRemoveBatchResourcesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteDiscountConditionRes, Failure>> deleteDiscountCondition({
    required String discountId,
    required String conditionId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/discounts/$discountId/conditions/$conditionId',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteDiscountConditionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveDiscountConditionRes, Failure>> retrieveDiscountCondition({
    required String discountId,
    required String conditionId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/discounts/$discountId/conditions/$conditionId',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveDiscountConditionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
