import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ExportUseCase {
  BatchJobsRepository get _batchRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static ExportUseCase get instance => getIt<ExportUseCase>();

  Future<Result<BatchJob, Failure>> call(BatchJobType batchJobType) async {
    try {
      final result = await _batchRepository.createBatchJob(
          BatchJobCreateReq(type: batchJobType.value, context: {}));
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
