import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class LoadStoresUseCase {
  final MedusaAdminV2 _medusaAdmin;

  LoadStoresUseCase(this._medusaAdmin);

  StoresRepository get _storeRepository => _medusaAdmin.store;

  static LoadStoresUseCase get instance => getIt<LoadStoresUseCase>();

  Future<Result<StoreListRes, MedusaError>> call(
    Map<String, dynamic>? query,
  ) async {
    try {
      final result = await _storeRepository.list(query: query);
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
}
