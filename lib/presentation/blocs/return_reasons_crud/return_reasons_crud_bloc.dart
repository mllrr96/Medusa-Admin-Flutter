import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/return_reason/return_reasons_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'return_reasons_crud_event.dart';
part 'return_reasons_crud_state.dart';
part 'return_reasons_crud_bloc.freezed.dart';

@injectable
class ReturnReasonsCrudBloc
    extends Bloc<ReturnReasonsCrudEvent, ReturnReasonsCrudState> {
  ReturnReasonsCrudBloc(ReturnReasonCrudUseCase returnReasonCrudUseCase)
      : _useCase = returnReasonCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  void _load(_Load event, Emitter<ReturnReasonsCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when((returnReason) => emit(_ReturnReason(returnReason)),
        (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<ReturnReasonsCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(
        queryParameters: {'limit': pageSize, ...?event.queryParameters});
    result.when(
        (response) => emit(
            _ReturnReasons(response.returnReasons ?? [], response.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  void _create(_Create event, Emitter<ReturnReasonsCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.userCreateReturnReasonReq);
    result.when((returnReason) => emit(_ReturnReason(returnReason)),
        (error) => emit(_Error(error)));
  }

  void _update(_Update event, Emitter<ReturnReasonsCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(
        id: event.id,
        userUpdateReturnReasonReq: event.userUpdateReturnReasonReq);
    result.when((returnReason) => emit(_ReturnReason(returnReason)),
        (error) => emit(_Error(error)));
  }

  void _delete(_Delete event, Emitter<ReturnReasonsCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when((returnReason) => emit(const _Deleted()),
        (error) => emit(_Error(error)));
  }

  final ReturnReasonCrudUseCase _useCase;
  static int pageSize = 20;
  static ReturnReasonsCrudBloc get instance => getIt<ReturnReasonsCrudBloc>();
}
