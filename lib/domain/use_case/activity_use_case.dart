import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ActivityUseCase {
  // BatchJobsRepository get _batchRepository =>
  //     getIt<MedusaAdmin>().batchJobsRepository;

  UploadRepository get _uploadRepository =>
      getIt<MedusaAdmin>().uploadRepository;

  static ActivityUseCase get instance => getIt<ActivityUseCase>();

  Future<Result<bool, Failure>> delete(String fileKey) async {
    try {
      final result = await _uploadRepository.deleteFile(fileKey: fileKey);
      if (result?.deleted == true) {
        return const Success(true);
      } else {
        return Error(Failure(message: 'Error deleting file', type: ''));
      }
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
