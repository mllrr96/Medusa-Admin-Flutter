import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateShippingProfileUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateShippingProfileUseCase(this._medusaAdmin);

  ShippingProfilesRepository get _shippingProfilesRepository => _medusaAdmin.shippingProfiles;

  static UpdateShippingProfileUseCase get instance => getIt<UpdateShippingProfileUseCase>();

  Future<Result<ShippingProfile, MedusaError>> call(
      String id, UpdateShippingProfileReq payload) async {
    try {
      final result = await _shippingProfilesRepository.update(id, payload);
      return Success(result.shippingProfile);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
