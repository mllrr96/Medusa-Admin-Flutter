import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class LoadStoreUseCase {
  final MedusaAdminV2 _medusaAdmin;

  LoadStoreUseCase(this._medusaAdmin);

  StoreRepository get _storeRepository => _medusaAdmin.store;

  static LoadStoreUseCase get instance => getIt<LoadStoreUseCase>();

  Future<Result<Store, MedusaError>> call(String id) async {
    try {
      final result = await _storeRepository
          .retrieve(id, query: {'expand': 'currencies,default_sales_channel'});
      return Success(result.store);
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
