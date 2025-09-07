import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
@lazySingleton
class UpdateRegionUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateRegionUseCase(this._medusaAdmin);
  // StoreRepository get _storeRepository => _medusaAdmin.store;
  RegionsRepository get _regionsRepository => _medusaAdmin.regions;

  static UpdateRegionUseCase get instance => getIt<UpdateRegionUseCase>();

  // Future<Result<List<PaymentProvider>, MedusaError>> fetchPaymentProviders() async {
  //   try {
  //     final result = await _storeRepository.retrievePaymentProviders();
  //     return Success(result!);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error, stack) {
  //     if (kDebugMode) {
  //       log(error.toString());
  //       log(stack.toString());
  //     }
  //     return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }

  Future<Result<Region, MedusaError>> create(
      CreateRegionReq userCreateRegionReq) async {
    try {
      final result = await _regionsRepository.create(
          userCreateRegionReq);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Region, MedusaError>> update({
    required String id,
    required UpdateRegionReq userUpdateRegionReq,
  }) async {
    try {
      final result = await _regionsRepository.update(
          id, userUpdateRegionReq);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
