import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class ReturnReasonCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  ReturnReasonCrudUseCase(this._medusaAdmin);

  ReturnReasonsRepository get _returnReasonRepository =>
      _medusaAdmin.returnReasons;

  static ReturnReasonCrudUseCase get instance =>
      getIt<ReturnReasonCrudUseCase>();

  Future<Result<ReturnReason, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _returnReasonRepository.retrieve(id);
      return Success(result.returnReason);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ReturnReasonListRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result =
          await _returnReasonRepository.retrieveAll(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ReturnReasonDeleteRes, MedusaError>> delete(String id) async {
    try {
      final result = await _returnReasonRepository.delete(id);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ReturnReason, MedusaError>> create(
      CreateReturnReason createReturnReason) async {
    try {
      final result = await _returnReasonRepository.create(createReturnReason);
      return Success(result.returnReason);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ReturnReason, MedusaError>> update({
    required String id,
    required UpdateReturnReason updateReturnReason,
  }) async {
    try {
      final result =
          await _returnReasonRepository.update(id, updateReturnReason);
      return Success(result.returnReason);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
