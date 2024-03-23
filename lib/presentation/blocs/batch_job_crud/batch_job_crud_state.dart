part of 'batch_job_crud_bloc.dart';

@freezed
class BatchJobCrudState with _$BatchJobCrudState {
  const factory BatchJobCrudState.initial() = _Initial;
  const factory BatchJobCrudState.loading() = _Loading;
  const factory BatchJobCrudState.batchJob(BatchJob batchJob) = _BatchJob;
  const factory BatchJobCrudState.batchJobs(
      List<BatchJob> batchJobs, int count) = _BatchJobs;
  const factory BatchJobCrudState.error(Failure failure) = _Error;
}
