import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/order_edit/order_edit_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'order_edit_crud_event.dart';
part 'order_edit_crud_state.dart';
part 'order_edit_crud_bloc.freezed.dart';

@injectable
class OrderEditCrudBloc extends Bloc<OrderEditCrudEvent, OrderEditCrudState> {
  OrderEditCrudBloc(OrderEditCrudUseCase orderEditCrudUseCase)
      : _useCase = orderEditCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_AddLineItem>(_addLineItem);
    on<_DeleteLineItem>(_deleteLineItem);
    on<_UpsertLineItem>(_upsertLineItem);
    on<_DeleteLineItemChange>(_deleteLineItemChange);
    on<_Cancel>(_cancel);
    on<_Confirm>(_confirm);
    on<_Create>(_create);
    on<_Delete>(_delete);
    on<_LoadAll>(_loadAll);
  }

  Future<void> _load(_Load event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.requestOrderEdit(id: event.id);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _addLineItem(
      _AddLineItem event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.addLineItem(
        id: event.id, payload: event.userAddLineItemReq);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _deleteLineItem(
      _DeleteLineItem event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit =
        await _useCase.deleteLineItem(id: event.id, itemId: event.itemId);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _upsertLineItem(
      _UpsertLineItem event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.upsertLineItemChange(
        id: event.id, itemId: event.itemId, quantity: event.quantity);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _deleteLineItemChange(
      _DeleteLineItemChange event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.deleteLineItemChange(
        id: event.id, changeId: event.changeId);
    orderEdit.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _cancel(_Cancel event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.cancelOrderEdit(id: event.id);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _confirm(
      _Confirm event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.confirmOrderEdit(id: event.id);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _create(_Create event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.createOrderEdit(
        id: event.id, internalNote: event.internalNote);
    orderEdit.when(
        (success) => emit(_OrderEdit(success)), (error) => emit(_Error(error)));
  }

  Future<void> _delete(_Delete event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdit = await _useCase.deleteOrderEdit(id: event.id);
    orderEdit.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(
      _LoadAll event, Emitter<OrderEditCrudState> emit) async {
    emit(const _Loading());
    final orderEdits =
        await _useCase.fetchOrderEdits(queryParameters: event.queryParameters);
    orderEdits.when(
        (success) =>
            emit(_OrderEdits(success.orderEdits ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final OrderEditCrudUseCase _useCase;
  static OrderEditCrudBloc get instance => getIt<OrderEditCrudBloc>();
}
