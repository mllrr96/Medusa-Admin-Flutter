import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateShippingOptionUseCase {
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;
  ShippingOptionsRepository get _shippingOptionsRepository =>
      getIt<MedusaAdmin>().shippingOptionsRepository;
  ShippingProfileRepository get _profileRepository =>
      getIt<MedusaAdmin>().shippingProfileRepository;

  static UpdateShippingOptionUseCase get instance =>
      getIt<UpdateShippingOptionUseCase>();

  Future<Result<List<FulfillmentOption>, MedusaError>> fetchFulfillmentOptions(
      String id) async {
    try {
      final result =
          await _regionsRepository.retrieveFulfillmentOptions(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, MedusaError>> createShippingOption(
      CreateShippingOptionReq userCreateShippingOptionReq) async {
    try {
      final result = await _shippingOptionsRepository.create(
          userCreateShippingOptionReq: userCreateShippingOptionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, MedusaError>> updateShippingOption(
      {required String id,
      required UpdateShippingOptionReq userUpdateShippingOptionReq}) async {
    try {
      final result = await _shippingOptionsRepository.update(
          userUpdateShippingOptionReq: userUpdateShippingOptionReq, id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<RetrieveAllShippingProfileRes, MedusaError>>
      fetchShippingProfiles({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _profileRepository.retrieveAll(queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
