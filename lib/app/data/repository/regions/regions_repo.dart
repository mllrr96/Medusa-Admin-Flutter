import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_create_region_req.dart';
import 'package:medusa_admin/app/data/models/res/regions.dart';
import 'package:medusa_admin/app/data/repository/regions/base_regions.dart';

import '../../datasource/remote/dio/dio_client.dart';
import '../../service/storage_service.dart';

class RegionsRepo extends BaseRegions {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);

  @override
  Future<Result<UserRegionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions', queryParameters: queryParams);
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
}
