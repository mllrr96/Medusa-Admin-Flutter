import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class RegionCrudUseCase {
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;

  static RegionCrudUseCase get instance => getIt<RegionCrudUseCase>();

  Future<Result<UserRegionsRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Region, Failure>> load(
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

  Future<Result<Region, Failure>> create(
      UserCreateRegionReq userCreateRegionReq) async {
    try {
      final result = await _regionsRepository.create(
          userCreateRegionReq: userCreateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, Failure>> update({
    required String id,
    required UserUpdateRegionReq userUpdateRegionReq,
  }) async {
    try {
      final result = await _regionsRepository.update(
          id: id, userUpdateRegionReq: userUpdateRegionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteRegionRes, Failure>> delete(String id) async {
    try {
      final result = await _regionsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Region, Failure>> addCountry({
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

  Future<Result<Region, Failure>> removeCountry({
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

  Future<Result<List<FulfillmentOption>, Failure>> loadFulfillmentOptions(
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

  Future<Result<Region, Failure>> addFulfillmentProvider({
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

  Future<Result<Region, Failure>> removeFulfillmentProvider({
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

  Future<Result<Region, Failure>> addPaymentProvider({
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

  Future<Result<Region, Failure>> removePaymentProvider({
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
