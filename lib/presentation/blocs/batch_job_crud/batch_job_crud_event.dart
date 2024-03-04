part of 'batch_job_crud_bloc.dart';

@freezed
class BatchJobCrudEvent with _$BatchJobCrudEvent {
  const factory BatchJobCrudEvent.create(BatchJobType batchJobType,
      {Map<String, dynamic>? context, bool? dryRun}) = _Create;
  const factory BatchJobCrudEvent.cancel(String id) = _Cancel;
  const factory BatchJobCrudEvent.confirm(String id) = _Confirm;
  const factory BatchJobCrudEvent.load(String id) = _Load;
  const factory BatchJobCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
