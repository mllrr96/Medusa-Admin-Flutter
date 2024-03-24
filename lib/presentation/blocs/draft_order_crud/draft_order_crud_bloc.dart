import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/draft_order/draft_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'draft_order_crud_event.dart';
part 'draft_order_crud_state.dart';
part 'draft_order_crud_bloc.freezed.dart';

@injectable
class DraftOrderCrudBloc
    extends Bloc<DraftOrderCrudEvent, DraftOrderCrudState> {
  DraftOrderCrudBloc(this.draftCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Update>(_update);
    on<_Create>(_create);
    on<_Delete>(_delete);
    on<_RegisterPayment>(_registerPayment);
  }

  Future<void> _load(_Load event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.retrieveDraftOrder(
      id: event.id,
      queryParameters: {'expand': 'order,cart'},
    );
    result.when(
      (draftOrder) {
        emit(_DraftOrder(draftOrder));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  Future<void> _loadAll(_LoadAll event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.retrieveDraftOrders(
      queryParameters: {
        'limit': pageSize,
        ...?event.queryParameters,
      },
    );
    result.when(
      (response) {
        emit(_DraftOrders(response.draftOrders ?? [], response.count ?? 0));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  Future<void> _registerPayment(
      _RegisterPayment event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.registerPayment(id: event.id);
    await result.when(
      (success) async {
        emit(const _PaymentRegistered());
        final draftOrderResult = await draftCrudUseCase.retrieveDraftOrder(
          id: event.id,
          queryParameters: {'expand': 'order,cart'},
        );
        draftOrderResult.when(
          (draftOrder) {
            emit(_DraftOrder(draftOrder));
          },
          (error) {
            emit(_Error(error));
          },
        );
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  Future<void> _update(_Update event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.update(
        id: event.id, payload: event.userUpdateDraftOrderReq);
    result.when(
      (draftOrder) {
        emit(_DraftOrder(draftOrder));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  Future<void> _create(_Create event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.create(
        payload: event.userCreateDraftOrderReq);
    result.when(
      (draftOrder) {
        emit(_DraftOrder(draftOrder));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  Future<void> _delete(_Delete event, Emitter<DraftOrderCrudState> emit) async {
    emit(const _Loading());
    final result = await draftCrudUseCase.cancelDraft(id: event.id);
    result.when(
      (success) {
        emit(const _Deleted());
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  final DraftCrudUseCase draftCrudUseCase;
  static DraftOrderCrudBloc get instance => getIt<DraftOrderCrudBloc>();
  static int pageSize = 20;
}
