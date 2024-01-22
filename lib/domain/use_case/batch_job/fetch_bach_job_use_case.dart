import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class FetchBatchJobUseCase {
  BatchJobsRepository get _batchRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static FetchBatchJobUseCase get instance => getIt<FetchBatchJobUseCase>();

  Future<Result<BatchJob, Failure>> call(String id,
      {Map<String, dynamic>? context, bool dryRun = false}) async {
    try {
      final result = await _batchRepository.retrieveBatchJob(id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
