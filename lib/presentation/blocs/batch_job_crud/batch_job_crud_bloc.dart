import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/batch_job/bach_job_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'batch_job_crud_event.dart';
part 'batch_job_crud_state.dart';
part 'batch_job_crud_bloc.freezed.dart';

@injectable
class BatchJobCrudBloc extends Bloc<BatchJobCrudEvent, BatchJobCrudState> {
  BatchJobCrudBloc(BatchJobCrudUseCase batchJobCrudUseCase)
      : _useCase = batchJobCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Cancel>(_cancel);
    on<_Confirm>(_confirm);
  }

  Future<void> _load(_Load event, Emitter<BatchJobCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when((batchJob) {
      emit(_BatchJob(batchJob));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _loadAll(_LoadAll event, Emitter<BatchJobCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(
        queryParameters: {'limit': pageSize, ...?event.queryParameters});
    result.when((response) {
      emit(_BatchJobs(response.batchJobs ?? [], response.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _create(_Create event, Emitter<BatchJobCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.batchJobType,
        context: event.context, dryRun: event.dryRun ?? false);
    result.when((batchJob) {
      emit(_BatchJob(batchJob));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _cancel(_Cancel event, Emitter<BatchJobCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.cancel(event.id);
    result.when((batchJob) {
      emit(_BatchJob(batchJob));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _confirm(_Confirm event, Emitter<BatchJobCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.confirm(event.id);
    result.when((batchJob) {
      emit(_BatchJob(batchJob));
    }, (error) {
      emit(_Error(error));
    });
  }

  final BatchJobCrudUseCase _useCase;
  static const int pageSize = 10;
  static BatchJobCrudBloc get instance => getIt<BatchJobCrudBloc>();
}
