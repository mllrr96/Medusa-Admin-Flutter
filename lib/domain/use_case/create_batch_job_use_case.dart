import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CreateBatchJobUseCase {
  BatchJobsRepository get _batchRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static CreateBatchJobUseCase get instance => getIt<CreateBatchJobUseCase>();

  Future<Result<BatchJob, Failure>> call(BatchJobType batchJobType,
      {Map<String, dynamic>? context, bool dryRun = false}) async {
    try {
      final result = await _batchRepository.createBatchJob(BatchJobCreateReq(
          type: batchJobType.value, context: context ?? {}, dryRun: dryRun));
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
