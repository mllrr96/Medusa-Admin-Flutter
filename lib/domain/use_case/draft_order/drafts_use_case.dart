import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftsUseCase {
  DraftOrdersRepository get _draftOrderRepository => _medusaAdminV2.draftOrders;
  final MedusaAdminV2 _medusaAdminV2;

  DraftsUseCase(this._medusaAdminV2);
  static DraftsUseCase get instance => getIt<DraftsUseCase>();

  Future<Result<DraftOrdersRes, MedusaError>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftOrderRepository.list(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
