import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GetFileUrlUseCase {
  UploadRepository get _uploadRepository =>
      getIt<MedusaAdmin>().uploadRepository;

  static GetFileUrlUseCase get instance => getIt<GetFileUrlUseCase>();

  Future<Result<String, Failure>> call(String fileKey,
      {Map<String, dynamic>? context, bool dryRun = false}) async {
    try {
      final result = await _uploadRepository.getFileUrl(fileKey: fileKey);

      return Success(result.replaceAll('\\', '/'));
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
