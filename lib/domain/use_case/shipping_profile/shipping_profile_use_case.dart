import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../core/di/di.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
@lazySingleton
class ShippingProfileCrudUseCase {
  ShippingProfileRepository get _shippingProfileRepository =>
      getIt<MedusaAdmin>().shippingProfileRepository;

  Future<Result<ShippingProfile, MedusaError>> create(
      CreateShippingProfileReq userCreateShippingProfileReq) async {
    try {
      final result = await _shippingProfileRepository.create(
          userCreateShippingProfileReq: userCreateShippingProfileReq);
      return Success(result!);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingProfile, MedusaError>> update(
      {required String id,
      required UpdateShippingProfileReq
          userUpdateShippingProfileReq}) async {
    try {
      final result = await _shippingProfileRepository.update(
          userUpdateShippingProfileReq: userUpdateShippingProfileReq, id: id);
      return Success(result!);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<RetrieveAllShippingProfileRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingProfileRepository.retrieveAll(
          queryParams: queryParams);
      return Success(result!);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingProfile, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingProfileRepository.retrieve(
          id: id, queryParams: queryParams);
      return Success(result!);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<DeleteShippingProfileRes, MedusaError>> delete(
      String id) async {
    try {
      final result = await _shippingProfileRepository.delete(id: id);
      return Success(result!);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
