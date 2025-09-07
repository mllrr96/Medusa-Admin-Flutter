import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';

@lazySingleton
class UpdateGroupUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateGroupUseCase(this._medusaAdmin);

  static UpdateGroupUseCase get instance => getIt<UpdateGroupUseCase>();

  CustomerGroupsRepository get _customerGroupRepository => _medusaAdmin.customerGroups;

  Future<Result<CustomerGroup, MedusaError>> updateCustomerGroup({
    required String id,
    required UpdateCustomerGroupReq payload,
  }) async {
    try {
      final result = await _customerGroupRepository.update(id, payload);
      return Success(result.customerGroup);
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

  Future<Result<CustomerGroup, MedusaError>> createCustomerGroup({
    required CreateCustomerGroupReq payload,
  }) async {
    try {
      final result = await _customerGroupRepository.create(payload);
      return Success(result.customerGroup);
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
