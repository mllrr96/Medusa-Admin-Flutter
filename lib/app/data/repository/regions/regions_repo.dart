import 'dart:developer';
import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_region_req.dart';
import 'package:medusa_admin/app/data/models/res/regions.dart';
import 'package:medusa_admin/app/data/repository/regions/base_regions.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class RegionsRepo extends BaseRegions {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserRegionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions/$id', queryParameters: queryParams);
      if (response.statusCode == 200) {
        return Success(UserRegionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionRes, Failure>> create(
      {required UserCreateRegionReq userCreateRegionReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response =
          await _dataProvider.post(uri: '/regions', data: userCreateRegionReq.toJson(), queryParameters: queryParams);
      if (response.statusCode == 200) {
        return Success(UserRegionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> addCountryToRegion(
      {required String id, required String countryCode, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/regions/$id/countries', data: {'country_code': countryCode});
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> addFulfillmentProvider(
      {required String id, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response =
          await _dataProvider.post(uri: '/regions/$id/fulfillment-providers', data: {'provider_id': providerId});
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> addPaymentProvider(
      {required String id, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response =
          await _dataProvider.post(uri: '/regions/$id/payment-providers', data: {'provider_id': providerId});
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteRegionRes, Failure>> delete(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/regions/$id');
      if (response.statusCode == 200) {
        return Success(UserDeleteRegionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> deleteFulfillmentProvider(
      {required String id, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/regions/$id/fulfillment-providers/$providerId');
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> deletePaymentProvider(
      {required String id, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/regions/$id/payment-providers/$providerId');
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionsRes, Failure>> removeCountryFromRegion(
      {required String id, required String countryCode, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete('/regions/$id/countries/$countryCode');
      if (response.statusCode == 200) {
        return Success(UserRegionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveFulfillmentOptionsRes, Failure>> retrieveFulfillmentOptions(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions/$id/fulfillment-options');
      if (response.statusCode == 200) {
        return Success(UserRetrieveFulfillmentOptionsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRegionRes, Failure>> update(
      {required String id,
      required UserUpdateRegionReq userUpdateRegionReq,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/regions/$id', data: userUpdateRegionReq.toJson());
      if (response.statusCode == 200) {
        return Success(UserRegionRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
