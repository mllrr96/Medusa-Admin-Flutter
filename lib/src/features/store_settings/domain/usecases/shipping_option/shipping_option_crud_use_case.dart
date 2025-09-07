import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class ShippingOptionCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  ShippingOptionCrudUseCase(this._medusaAdmin);

  ShippingOptionsRepository get _shippingOptionsRepository => _medusaAdmin.shippingOptions;

  Future<Result<ShippingOption, MedusaError>> create(CreateShippingOptionReq payload) async {
    try {
      final result = await _shippingOptionsRepository.create(body: payload);
      return Success(result.shippingOption);
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

  Future<Result<ShippingOption, MedusaError>> update(
      {required String id, required UpdateShippingOptionReq payload}) async {
    try {
      final result = await _shippingOptionsRepository.update(id: id, body: payload);
      return Success(result.shippingOption);
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

  Future<Result<ShippingOptionDeleteRes, MedusaError>> delete(String id) async {
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingOptionListRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.list(query: queryParams);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ShippingOptionRes, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieve(id: id, query: queryParams);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
