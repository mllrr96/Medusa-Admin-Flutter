import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DeleteFileUseCase {
  // BatchJobsRepository get _batchRepository =>
  //     getIt<MedusaAdmin>().batchJobsRepository;

  UploadRepository get _uploadRepository =>
      getIt<MedusaAdmin>().uploadRepository;

  static DeleteFileUseCase get instance => getIt<DeleteFileUseCase>();

  Future<Result<bool, Failure>> call(String fileKey) async {
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
