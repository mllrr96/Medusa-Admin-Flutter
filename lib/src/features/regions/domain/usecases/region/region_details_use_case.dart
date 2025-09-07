import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class RegionDetailsUseCase {
  final MedusaAdminV2 _medusaAdmin;

  RegionDetailsUseCase(this._medusaAdmin);

  RegionsRepository get _regionsRepository => _medusaAdmin.regions;

  ShippingOptionsRepository get _shippingOptionsRepository =>
      _medusaAdmin.shippingOptions;

  static RegionDetailsUseCase get instance => getIt<RegionDetailsUseCase>();

  Future<Result<Region, MedusaError>> fetchRegion(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _regionsRepository.retrieve(id, query: queryParameters);
      return Success(result.region);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<RegionDeleteRes, MedusaError>> deleteRegion(String id) async {
    try {
      final result = await _regionsRepository.delete(id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingOptionDeleteRes, MedusaError>> deleteShippingOption(
      String id) async {
    try {
      final result = await _shippingOptionsRepository.delete(id: id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingOptionListRes, MedusaError>> fetchShippingOptions({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _shippingOptionsRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
