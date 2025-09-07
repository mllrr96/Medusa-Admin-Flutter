import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@lazySingleton
class RegionCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  RegionCrudUseCase(this._medusaAdmin);

  RegionsRepository get _regionsRepository => _medusaAdmin.regions;

  static RegionCrudUseCase get instance => getIt<RegionCrudUseCase>();

  Future<Result<RegionsRes, MedusaError>> loadAll({Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(query: queryParameters);
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

  Future<Result<Region, MedusaError>> load(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _regionsRepository.retrieve(id, query: queryParameters);
      return Success(result.region);
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

  Future<Result<Region, MedusaError>> create(
    CreateRegionReq createRegionReq, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _regionsRepository.create(createRegionReq, query: queryParameters);
      return Success(result.region);
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

  Future<Result<Region, MedusaError>> update({
    required String id,
    required UpdateRegionReq userUpdateRegionReq,
  }) async {
    try {
      final result =
          await _regionsRepository.update(id, userUpdateRegionReq);
      return Success(result.region);
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

  Future<Result<RegionDeleteRes, MedusaError>> delete(String id) async {
    try {
      final result = await _regionsRepository.delete(id);
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

  // TODO: check how to add a country, this approach might remove all existing countries
  Future<Result<Region, MedusaError>> addCountry({
    required String id,
    required String countryCode,
  }) async {
    try {
      final result = await _regionsRepository.update(id, UpdateRegionReq(
        countries: [countryCode]
      ));
      return Success(result.region);
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

  // TODO: check how to remove a country
  Future<Result<Region, MedusaError>> removeCountry({
    required String id,
    required String countryCode,
  }) async {
    try {
      final result =
          await _regionsRepository.update(id,  UpdateRegionReq(
          ));
      return Success(result.region);
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

  // Future<Result<List<FulfillmentOption>, MedusaError>> loadFulfillmentOptions(
  //   String id,
  // ) async {
  //   try {
  //     final result = await _regionsRepository.retrieveFulfillmentOptions(id: id);
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
  //
  // Future<Result<Region, MedusaError>> addFulfillmentProvider({
  //   required String id,
  //   required String providerId,
  // }) async {
  //   try {
  //     final result =
  //         await _regionsRepository.addFulfillmentProvider(id: id, providerId: providerId);
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
  //
  // Future<Result<Region, MedusaError>> removeFulfillmentProvider({
  //   required String id,
  //   required String providerId,
  // }) async {
  //   try {
  //     final result =
  //         await _regionsRepository.deleteFulfillmentProvider(id: id, providerId: providerId);
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

  // Future<Result<Region, MedusaError>> addPaymentProvider({
  //   required String id,
  //   required String providerId,
  // }) async {
  //   try {
  //     final result = await _regionsRepository.addPaymentProvider(id: id, providerId: providerId);
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
  //
  // Future<Result<Region, MedusaError>> removePaymentProvider({
  //   required String id,
  //   required String providerId,
  // }) async {
  //   try {
  //     final result = await _regionsRepository.deletePaymentProvider(id: id, providerId: providerId);
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
}
