import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GetFileUrlUseCase {
  UploadsRepository get _uploadRepository => _medusaAdminV2.uploads;
  final MedusaAdminV2 _medusaAdminV2;

  GetFileUrlUseCase(this._medusaAdminV2);

  static GetFileUrlUseCase get instance => getIt<GetFileUrlUseCase>();

  Future<Result<UploadsPresignedUrlRes, MedusaError>> call(UploadsPresignedUrlReq payload,
      {Map<String, dynamic>? context, bool dryRun = false}) async {
    try {
      final result = await _uploadRepository.getPresignedUrl(payload);

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
