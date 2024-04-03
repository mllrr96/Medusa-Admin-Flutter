import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/note/note_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'note_crud_event.dart';
part 'note_crud_state.dart';
part 'note_crud_bloc.freezed.dart';

@injectable
class NoteCrudBloc extends Bloc<NoteCrudEvent, NoteCrudState> {
  NoteCrudBloc(NoteCrudUseCase noteCrudUseCase)
      : _useCase = noteCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_Delete>(_delete);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_LoadAll>(_loadAll);
  }

  void _load(_Load event, Emitter<NoteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when(
        (success) => emit(_Note(success)), (error) => emit(_Error(error)));
  }

  void _delete(_Delete event, Emitter<NoteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  void _create(_Create event, Emitter<NoteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(
        resourceId: event.resourceId,
        resourceType: event.resourceType,
        value: event.value);
    result.when(
        (success) => emit(_Note(success)), (error) => emit(_Error(error)));
  }

  void _update(_Update event, Emitter<NoteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(event.id, event.value);
    result.when(
        (success) => emit(_Note(success)), (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<NoteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(
        queryParameters: {'limit': pageSize, ...?event.queryParameters});
    result.when(
        (success) => emit(_Notes(success.notes ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final NoteCrudUseCase _useCase;
  static int pageSize = 10;
  static NoteCrudBloc get instance => getIt<NoteCrudBloc>();
}
