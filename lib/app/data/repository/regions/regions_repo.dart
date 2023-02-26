import 'dart:developer';

import 'package:dartz/dartz.dart';
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
  Future<Either<UserRegionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions', queryParameters: queryParams);
      if (response.statusCode == 200) {
        return left(UserRegionsRes.fromJson(response.data));
      } else {
        return right(Failure(error: response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return right(Failure(error: error));
    }
  }

  @override
  Future<Either<UserRegionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParams, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/regions/$id', queryParameters: queryParams);
      if (response.statusCode == 200) {
        return left(UserRegionRes.fromJson(response.data));
      } else {
        return right(Failure(error: response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return right(Failure(error: error));
    }
  }

  @override
  Future<Either<UserRegionRes, Failure>> create(
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
        return left(UserRegionRes.fromJson(response.data));
      } else {
        return right(Failure(error: response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return right(Failure(error: error));
    }
  }
}
