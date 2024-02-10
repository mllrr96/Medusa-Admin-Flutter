import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/group/group_crud_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'group_crud_event.dart';
part 'group_crud_state.dart';
part 'group_crud_bloc.freezed.dart';

@injectable
class GroupCrudBloc extends Bloc<GroupCrudEvent, GroupCrudState> {
  GroupCrudBloc(this.groupCrudUseCase) : super(const GroupCrudState.initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Delete>(_delete);
    on<_Update>(_update);
    on<_AddCustomers>(_addCustomers);
    on<_RemoveCustomers>(_removeCustomers);
  }
  Future<void> _load(_Load event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.retrieve(id: event.id);
    result.when((group) => emit(_Group(group)), (error) => emit(_Error(error)));
  }

  Future<void> _create(_Create event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.create(
        name: event.name, metadata: event.metadata);
    result.when((group) => emit(_Group(group)), (error) => emit(_Error(error)));
  }

  Future<void> _delete(_Delete event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.delete(id: event.id);
    result.when(
        (group) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _update(_Update event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.update(
        id: event.id, name: event.name, metadata: event.metadata);
    result.when((group) => emit(_Group(group)), (error) => emit(_Error(error)));
  }

  Future<void> _addCustomers(
      _AddCustomers event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.addCustomers(
        id: event.id, customerIds: event.customerIds);
    result.when((group) => emit(_Group(group)), (error) => emit(_Error(error)));
  }

  Future<void> _removeCustomers(
      _RemoveCustomers event, Emitter<GroupCrudState> emit) async {
    emit(const _Loading());
    final result = await groupCrudUseCase.removeCustomers(
        id: event.id, customerIds: event.customerIds);
    result.when((group) => emit(_Group(group)), (error) => emit(_Error(error)));
  }

  final GroupCrudUseCase groupCrudUseCase;
  static GroupCrudBloc get instance => getIt<GroupCrudBloc>();
}
