import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateStoreUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateStoreUseCase(this._medusaAdmin);

  StoreRepository get _storeRepository => _medusaAdmin.store;

  static UpdateStoreUseCase get instance => getIt<UpdateStoreUseCase>();

  Future<Result<Store, MedusaError>> call(String id, UpdateStoreReq payload) async {
    try {
      final result = await _storeRepository.update(id, payload);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
