import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DeleteFileUseCase {
  UploadsRepository get _uploadRepository => _medusaAdminV2.uploads;
  final MedusaAdminV2 _medusaAdminV2;

  DeleteFileUseCase(this._medusaAdminV2);

  static DeleteFileUseCase get instance => getIt<DeleteFileUseCase>();

  Future<Result<bool, MedusaError>> call(String id) async {
    try {
      final result = await _uploadRepository.delete(id);
      if (result.deleted) {
        return const Success(true);
      } else {
        return Error(MedusaError(
            code: 'unknown', type: 'unknown', message: 'Error deleting file'));
      }
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
