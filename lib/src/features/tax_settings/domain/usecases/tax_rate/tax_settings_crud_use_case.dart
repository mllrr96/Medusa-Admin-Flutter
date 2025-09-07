import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class TaxSettingsCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  TaxSettingsCrudUseCase(this._medusaAdmin);

  TaxRatesRepository get _taxRateRepository => _medusaAdmin.taxRates;

  static TaxSettingsCrudUseCase get instance => getIt<TaxSettingsCrudUseCase>();

  Future<Result<TaxRatesListRes, MedusaError>> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _taxRateRepository.list(query: queryParameters);
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

  Future<Result<TaxRate, MedusaError>> fetch(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _taxRateRepository.retrieve(
        id,
        query: queryParameters,
      );
      return Success(result.taxRate);
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

  Future<Result<TaxRateDeleteRes, MedusaError>> delete(String id) async {
    try {
      final result = await _taxRateRepository.delete(id);
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

  Future<Result<TaxRate, MedusaError>> create(
      TaxRateCreateReq taxRateCreateReq) async {
    try {
      final result = await _taxRateRepository.create(
        taxRateCreateReq,
      );
      return Success(result.taxRate);
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

  Future<Result<TaxRate, MedusaError>> update({
    required String id,
    required TaxRateUpdateReq taxRateUpdateReq,
  }) async {
    try {
      final result = await _taxRateRepository.update(
        id,
        taxRateUpdateReq,
      );
      return Success(result.taxRate);
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
