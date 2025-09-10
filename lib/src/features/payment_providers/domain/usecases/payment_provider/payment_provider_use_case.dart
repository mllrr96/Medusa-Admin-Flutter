import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PaymentProviderUseCase {
  final MedusaAdminV2 _medusaAdmin;

  PaymentProviderUseCase(this._medusaAdmin);

  PaymentsRepository get _paymentsRepository => _medusaAdmin.payments;

  static PaymentProviderUseCase get instance => getIt<PaymentProviderUseCase>();

  Future<Result<PaymentProviderListRes, MedusaError>> call(
      {Map<String, dynamic>? queryParam}) async {
    try {
      final result =
          await _paymentsRepository.listPaymentProviders(query: queryParam);
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
