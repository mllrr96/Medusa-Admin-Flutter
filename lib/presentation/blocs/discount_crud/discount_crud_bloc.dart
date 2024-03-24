import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/discount_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'discount_crud_event.dart';
part 'discount_crud_state.dart';
part 'discount_crud_bloc.freezed.dart';

@injectable
class DiscountCrudBloc extends Bloc<DiscountCrudEvent, DiscountCrudState> {
  DiscountCrudBloc(this.discountDetailsUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Update>(_update);
    on<_Create>(_create);

    on<_Delete>(_delete);
    on<_AddCondition>(_addCondition);
    on<_RemoveCondition>(_removeCondition);
    on<_AddItemsToCondition>(_addItemsToCondition);
    on<_RemoveItemsFromCondition>(_removeItemsFromCondition);
  }

  Future<void> _load(
    _Load event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.id));
    final result = await discountDetailsUseCase.retrieveDiscount(
      id: event.id,
    );
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(
    _LoadAll event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(const _Loading());
    final result =
        await discountDetailsUseCase.retrieveDiscounts(queryParameters: {
      'limit': pageSize,
      'is_dynamic': false,
      ...?event.queryParameters,
    });
    result.when((success) {
      emit(_Discounts(success.discounts ?? [], success.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.id));
    final result = await discountDetailsUseCase.updateDiscount(
      id: event.id,
      userUpdateDiscountReq: event.userUpdateDiscountReq,
    );
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _create(
    _Create event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await discountDetailsUseCase.createDiscount(
        userCreateDiscountReq: event.userCreateDiscountReq);
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _delete(
    _Delete event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result =
        await discountDetailsUseCase.deleteDiscount(id: event.discountId);
    result.when(
        (discount) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _addCondition(
    _AddCondition event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result = await discountDetailsUseCase.createDiscountCondition(
        discountId: event.discountId,
        userCreateConditionReq: event.userCreateConditionReq);
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _removeCondition(
    _RemoveCondition event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result = await discountDetailsUseCase.deleteDiscountCondition(
        discountId: event.discountId, conditionId: event.conditionId);
    result.when((discount) {
      if (discount.discount == null) {
        emit(_Error(Failure(message: 'Discount not found', type: '')));
      } else {
        emit(_Discount(discount.discount!));
      }
    }, (error) => emit(_Error(error)));
  }

  Future<void> _addItemsToCondition(
    _AddItemsToCondition event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result = await discountDetailsUseCase.addBatchResources(
        discountId: event.discountId,
        conditionId: event.conditionId,
        itemIds: event.itemIds);
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _removeItemsFromCondition(
    _RemoveItemsFromCondition event,
    Emitter<DiscountCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result = await discountDetailsUseCase.deleteBatchResources(
        discountId: event.discountId,
        conditionId: event.conditionId,
        itemIds: event.itemIds);
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  final DiscountCrudUseCase discountDetailsUseCase;
  static DiscountCrudBloc get instance => getIt<DiscountCrudBloc>();
  static int pageSize = 20;
}
