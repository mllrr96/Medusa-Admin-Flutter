import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateProductTagUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateProductTagUseCase(this._medusaAdmin);

  ProductTagsRepository get _productTagsRepository => _medusaAdmin.productTags;

  static UpdateProductTagUseCase get instance => getIt<UpdateProductTagUseCase>();

  Future<Result<ProductTagResponse, MedusaError>> call({
    required String id,
    required UpdateProductTag payload,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productTagsRepository.update(id, payload);
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
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
