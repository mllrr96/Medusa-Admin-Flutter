import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CreateDraftUseCase {
  DraftOrdersRepository get _draftRepository => _medusaAdminV2.draftOrders;
  final MedusaAdminV2 _medusaAdminV2;

  CreateDraftUseCase(this._medusaAdminV2);

  static CreateDraftUseCase get instance => getIt<CreateDraftUseCase>();

  Future<Result<DraftOrder, MedusaError>> call(
    PostDraftOrdersReq userCreateDraftOrderReq,
  ) async {
    try {
      final result = await _draftRepository.createDraftOrder(userCreateDraftOrderReq);
      return Success(result.draftOrder);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
