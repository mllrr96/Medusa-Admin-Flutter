import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class SalesChannelCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  SalesChannelCrudUseCase(this._medusaAdmin);

  SalesChannelsRepository get _salesChannelRepository =>
      _medusaAdmin.salesChannels;

  static SalesChannelCrudUseCase get instance =>
      getIt<SalesChannelCrudUseCase>();

  Future<Result<SalesChannel, MedusaError>> load(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieve(id);
      return Success(result.salesChannel);
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

  Future<Result<SalesChannelListRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParameters: queryParameters);
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

  Future<Result<SalesChannel, MedusaError>> removeProducts(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository.manageProducts(
          id, ManageProductsReq(remove: productIds));
      return Success(result.salesChannel);
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

  Future<Result<SalesChannel, MedusaError>> addProducts(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository.manageProducts(
          id, ManageProductsReq(add: productIds));
      return Success(result.salesChannel);
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

  Future<Result<Unit, MedusaError>> delete(String id) async {
    try {
      await _salesChannelRepository.delete(id);
      return Success(unit);
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

  Future<Result<SalesChannel, MedusaError>> create(
      CreateSalesChannel payload) async {
    try {
      final result = await _salesChannelRepository.create(payload);
      return Success(result.salesChannel);
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

  Future<Result<SalesChannel, MedusaError>> update(
      {required String id, required UpdateSalesChannel payload}) async {
    try {
      final result = await _salesChannelRepository.update(id, payload);
      return Success(result.salesChannel);
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
