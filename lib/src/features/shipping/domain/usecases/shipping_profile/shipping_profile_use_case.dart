import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class ShippingProfileCrudUseCase {
  final MedusaAdminV2 medusaAdmin;

  ShippingProfileCrudUseCase(this.medusaAdmin);

  ShippingProfilesRepository get _shippingProfileRepository =>
      medusaAdmin.shippingProfiles;

  Future<Result<ShippingProfile, MedusaError>> create(
      CreateShippingProfileReq payload) async {
    try {
      final result = await _shippingProfileRepository.create(payload);
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

  Future<Result<ShippingProfile, MedusaError>> update({
    required String id,
    required UpdateShippingProfileReq userUpdateShippingProfileReq,
  }) async {
    try {
      final result = await _shippingProfileRepository.update(
          id, userUpdateShippingProfileReq);
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

  Future<Result<ShippingProfileListRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingProfileRepository.retrieveAll(
          queryParameters: queryParams);
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

  Future<Result<ShippingProfile, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingProfileRepository.retrieve(id);
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

  Future<Result<Unit, MedusaError>> delete(String id) async {
    try {
      await _shippingProfileRepository.delete(id);
      return Success(unit);
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
