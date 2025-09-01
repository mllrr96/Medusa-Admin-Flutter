import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class UpdateShippingOptionUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateShippingOptionUseCase(this._medusaAdmin);

  // RegionsRepository get _regionsRepository => _medusaAdmin.regions;

  ShippingOptionsRepository get _shippingOptionsRepository => _medusaAdmin.shippingOptions;

  ShippingProfilesRepository get _profileRepository => _medusaAdmin.shippingProfiles;

  static UpdateShippingOptionUseCase get instance => getIt<UpdateShippingOptionUseCase>();

  // Future<Result<List<FulfillmentOption>, MedusaError>> fetchFulfillmentOptions(
  //     String id) async {
  //   try {
  //     final result =
  //         await _regionsRepository.retrieveFulfillmentOptions(id: id);
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

  Future<Result<ShippingOption, MedusaError>> createShippingOption(
      CreateShippingOptionReq payload) async {
    try {
      final result = await _shippingOptionsRepository.create(body: payload);
      return Success(result.shippingOption);
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

  Future<Result<ShippingOption, MedusaError>> updateShippingOption(
      {required String id, required UpdateShippingOptionReq payload}) async {
    try {
      final result = await _shippingOptionsRepository.update(
          body: payload, id: id);
      return Success(result.shippingOption);
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

  Future<Result<ShippingProfileListRes, MedusaError>> fetchShippingProfiles({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _profileRepository.retrieveAll(queryParameters: queryParameters);
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
