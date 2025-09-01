import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
@lazySingleton
class ShippingOptionCrudUseCase {
  ShippingOptionsRepository get _shippingOptionsRepository =>
      getIt<MedusaAdmin>().shippingOptionsRepository;

  Future<Result<ShippingOption, MedusaError>> create(
      CreateShippingOptionReq userCreateShippingOptionReq) async {
    try {
      final result = await _shippingOptionsRepository.create(
          userCreateShippingOptionReq: userCreateShippingOptionReq);
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

  Future<Result<ShippingOption, MedusaError>> update(
      {required String id,
      required UpdateShippingOptionReq userUpdateShippingOptionReq}) async {
    try {
      final result = await _shippingOptionsRepository.update(
          userUpdateShippingOptionReq: userUpdateShippingOptionReq, id: id);
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

  Future<Result<DeleteShippingOptionRes, MedusaError>> delete(String id) async {
    try {
      final result = await _shippingOptionsRepository.delete(id: id);
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

  Future<Result<RetrieveAllShippingOptionRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieveAll(
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

  Future<Result<ShippingOption, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieve(
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
}
