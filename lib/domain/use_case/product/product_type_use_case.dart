import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductTypeUseCase {
  final MedusaAdminV2 _medusaAdmin;

  ProductTypeUseCase(this._medusaAdmin);
  static ProductTypeUseCase get instance => getIt<ProductTypeUseCase>();
  ProductTypesRepository get _typesRepository => _medusaAdmin .productTypes;
  Future<Result<ProductTypeListResponse, MedusaError>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typesRepository.list(
          query: queryParameters);
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
