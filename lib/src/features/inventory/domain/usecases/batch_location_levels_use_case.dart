import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class BatchLocationLevelsUseCase {
  final MedusaAdminV2 _medusaAdmin;

  BatchLocationLevelsUseCase(this._medusaAdmin);

  InventoryItemsRepository get _inventoryItemsRepository => _medusaAdmin.inventoryItems;

  static BatchLocationLevelsUseCase get instance => getIt<BatchLocationLevelsUseCase>();

  Future<Result<void, MedusaError>> call(
    String id,
    BatchInventoryItemLocationsLevelReq body, {
    Map<String, dynamic>? query,
  }) async {
    try {
      await _inventoryItemsRepository.batchLocationLevels(id, body, query: query);
      return const Success(unit);
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
