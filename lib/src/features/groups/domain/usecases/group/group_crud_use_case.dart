import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GroupCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  GroupCrudUseCase(this._medusaAdmin);

  static GroupCrudUseCase get instance => getIt<GroupCrudUseCase>();

  CustomerGroupsRepository get _customerGroupRepository => _medusaAdmin.customerGroups;

  Future<Result<CustomerGroupsListRes, MedusaError>> retrieveAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.list(queryParameters: queryParameters);
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

  Future<Result<CustomerGroup, MedusaError>> removeCustomers(
      {required String id,
      required AddCustomersToGroupReq customerIds,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.removeCustomers(
        id,
        customerIds,
      );
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

  Future<Result<CustomerGroup, MedusaError>> addCustomers({
    required String id,
    required AddCustomersToGroupReq customerIds,
  }) async {
    try {
      final result = await _customerGroupRepository.addCustomers(
        id,
        customerIds,
      );
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

  Future<Result<CustomerGroupsDeleteRes, MedusaError>> delete(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.delete(
        id,
      );
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

  Future<Result<CustomerGroup, MedusaError>> update({
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

  Future<Result<CustomerGroup, MedusaError>> retrieve({
    required String id,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _customerGroupRepository.retrieve(id);
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

  Future<Result<CustomerGroup, MedusaError>> create(
      {required CreateCustomerGroupReq payload}) async {
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
