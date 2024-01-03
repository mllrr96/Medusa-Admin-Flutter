import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateShippingOptionUseCase {
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;
  final ShippingOptionsRepository _shippingOptionsRepository =
      getIt<MedusaAdmin>().shippingOptionsRepository;
  final ShippingProfileRepository _profileRepository =
      getIt<MedusaAdmin>().shippingProfileRepository;

  static UpdateShippingOptionUseCase get instance =>
      getIt<UpdateShippingOptionUseCase>();

  Future<Result<List<FulfillmentOption>, Failure>> fetchFulfillmentOptions(
      String id) async {
    try {
      final result =
          await _regionsRepository.retrieveFulfillmentOptions(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, Failure>> createShippingOption(
      UserCreateShippingOptionReq userCreateShippingOptionReq) async {
    try {
      final result = await _shippingOptionsRepository.create(
          userCreateShippingOptionReq: userCreateShippingOptionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, Failure>> updateShippingOption(
      {required String id,
      required UserUpdateShippingOptionReq userUpdateShippingOptionReq}) async {
    try {
      final result = await _shippingOptionsRepository.update(
          userUpdateShippingOptionReq: userUpdateShippingOptionReq, id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveAllShippingProfileRes, Failure>>
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
