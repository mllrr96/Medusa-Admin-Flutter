import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class RegionCrudUseCase {
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;

  static RegionCrudUseCase get instance => getIt<RegionCrudUseCase>();

  Future<Result<RegionsRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Region, MedusaError>> load(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _regionsRepository.retrieve(
          id: id, queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> create(
      CreateRegionReq userCreateRegionReq) async {
    try {
      final result = await _regionsRepository.create(
          userCreateRegionReq: userCreateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> update({
    required String id,
    required UpdateRegionReq userUpdateRegionReq,
  }) async {
    try {
      final result = await _regionsRepository.update(
          id: id, userUpdateRegionReq: userUpdateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteRegionRes, MedusaError>> delete(String id) async {
    try {
      final result = await _regionsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> addCountry({
    required String id,
    required String countryCode,
  }) async {
    try {
      final result = await _regionsRepository.addCountryToRegion(
          id: id, countryCode: countryCode);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> removeCountry({
    required String id,
    required String countryCode,
  }) async {
    try {
      final result = await _regionsRepository.removeCountryFromRegion(
          id: id, countryCode: countryCode);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<List<FulfillmentOption>, MedusaError>> loadFulfillmentOptions(
    String id,
  ) async {
    try {
      final result =
          await _regionsRepository.retrieveFulfillmentOptions(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> addFulfillmentProvider({
    required String id,
    required String providerId,
  }) async {
    try {
      final result = await _regionsRepository.addFulfillmentProvider(
          id: id, providerId: providerId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> removeFulfillmentProvider({
    required String id,
    required String providerId,
  }) async {
    try {
      final result = await _regionsRepository.deleteFulfillmentProvider(
          id: id, providerId: providerId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> addPaymentProvider({
    required String id,
    required String providerId,
  }) async {
    try {
      final result = await _regionsRepository.addPaymentProvider(
          id: id, providerId: providerId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, MedusaError>> removePaymentProvider({
    required String id,
    required String providerId,
  }) async {
    try {
      final result = await _regionsRepository.deletePaymentProvider(
          id: id, providerId: providerId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
