import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UploadUseCase {
  UploadsRepository get _uploadRepository => _medusaAdminV2.uploads;
  final MedusaAdminV2 _medusaAdminV2;

  UploadUseCase(this._medusaAdminV2);

  static UploadUseCase get instance => getIt<UploadUseCase>();

  Future<Result<List<Upload>, MedusaError>> call(FormData files,
      {Map<String, dynamic>? customHeaders}) async {
    try {
      final result = await _uploadRepository.create(files);
      return Success(result.files);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  // Future<Result<List<Upload>, MedusaError>> uploadProtected(List<File> files,
  //     {Map<String, dynamic>? customHeaders}) async {
  //   try {
  //     final result = await _uploadRepository.uploadProtected(
  //         files: files, customHeaders: customHeaders);
  //     return Success(result);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error) {
  //     return Error(
  //         MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }
}
