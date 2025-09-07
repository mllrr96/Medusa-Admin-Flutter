import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class ShippingOptionUseCase {
  final MedusaAdminV2 _medusaAdmin;

  ShippingOptionUseCase(this._medusaAdmin);

  ShippingOptionsRepository get _shippingOptionsRepository => _medusaAdmin.shippingOptions;

  static ShippingOptionUseCase get instance => getIt<ShippingOptionUseCase>();

  Future<Result<ShippingOptionListRes, MedusaError>> call(
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
}
