import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class BatchJobCrudUseCase {
  BatchJobsRepository get _batchRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static BatchJobCrudUseCase get instance => getIt<BatchJobCrudUseCase>();

  Future<Result<BatchJobsRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _batchRepository.retrieveBatchJobs(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<BatchJob, Failure>> load(String id) async {
    try {
      final result = await _batchRepository.retrieveBatchJob(id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<BatchJob, Failure>> cancel(String id) async {
    try {
      final result = await _batchRepository.cancelBatchJob(id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<BatchJob, Failure>> confirm(String id) async {
    try {
      final result = await _batchRepository.confirmBatchJob(id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<BatchJob, Failure>> create(BatchJobType batchJobType,
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
