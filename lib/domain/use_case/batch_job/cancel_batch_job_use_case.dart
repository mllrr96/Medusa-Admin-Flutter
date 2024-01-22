import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CancelBatchJobUseCase {
  BatchJobsRepository get _batchRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static CancelBatchJobUseCase get instance => getIt<CancelBatchJobUseCase>();

  Future<Result<BatchJob, Failure>> call(String id,
      {Map<String, dynamic>? context, bool dryRun = false}) async {
    try {
      final result = await _batchRepository.cancelBatchJob(id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
