import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/promotions/domain/usecases/promotion/promotion_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'promotion_crud_event.dart';
part 'promotion_crud_state.dart';
part 'promotion_crud_bloc.freezed.dart';

@injectable
class PromotionCrudBloc extends Bloc<PromotionCrudEvent, PromotionCrudState> {
  PromotionCrudBloc(this.discountDetailsUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Update>(_update);
    on<_Create>(_create);

    on<_Delete>(_delete);
    // on<_AddCondition>(_addCondition);
    // on<_RemoveCondition>(_removeCondition);
    // on<_AddItemsToCondition>(_addItemsToCondition);
    // on<_RemoveItemsFromCondition>(_removeItemsFromCondition);
  }

  Future<void> _load(
    _Load event,
    Emitter<PromotionCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.id));
    final result = await discountDetailsUseCase.retrievePromotion(
      id: event.id,
    );
    result.when((discount) => emit(_Discount(discount)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(
    _LoadAll event,
    Emitter<PromotionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result =
        await discountDetailsUseCase.retrievePromotions(queryParameters: {
      'limit': pageSize,
      // 'is_dynamic': false,
      ...?event.queryParameters,
    });
    result.when((success) {
      emit(_Discounts(success.promotions, success.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<PromotionCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.id));
    final result = await discountDetailsUseCase.updatePromotion(
      id: event.id,
      payload: event.payload,
    );
    result.when((promotion) => emit(_Discount(promotion)),
        (error) => emit(_Error(error)));
  }

  Future<void> _create(
    _Create event,
    Emitter<PromotionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result =
        await discountDetailsUseCase.createPromotion(payload: event.payload);
    result.when((promotion) => emit(_Discount(promotion)),
        (error) => emit(_Error(error)));
  }

  Future<void> _delete(
    _Delete event,
    Emitter<PromotionCrudState> emit,
  ) async {
    emit(_Loading(discountId: event.discountId));
    final result =
        await discountDetailsUseCase.deletePromotion(id: event.discountId);
    result.when(
        (discount) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  // Future<void> _addCondition(
  //   _AddCondition event,
  //   Emitter<PromotionCrudState> emit,
  // ) async {
  //   throw UnimplementedError();
  //   //
  //   // emit(_Loading(discountId: event.discountId));
  //   // final result = await discountDetailsUseCase.createDiscountCondition(
  //   //     discountId: event.discountId,
  //   //     userCreateConditionReq: event.userCreateConditionReq);
  //   // result.when((discount) => emit(_Discount(discount)),
  //   //     (error) => emit(_Error(error)));
  // }

  // Future<void> _removeCondition(
  //   _RemoveCondition event,
  //   Emitter<PromotionCrudState> emit,
  // ) async {
  //   throw UnimplementedError();
  // emit(_Loading(discountId: event.discountId));
  // final result = await discountDetailsUseCase.deleteDiscountCondition(
  //     discountId: event.discountId, conditionId: event.conditionId);
  // result.when((discount) {
  //   if (discount.discount == null) {
  //     emit(_Error(Failure(message: 'Discount not found', type: '')));
  //   } else {
  //     emit(_Discount(discount.discount!));
  //   }
  // }, (error) => emit(_Error(error)));
  // }

  // Future<void> _addItemsToCondition(
  //   _AddItemsToCondition event,
  //   Emitter<PromotionCrudState> emit,
  // ) async {
  //   emit(_Loading(discountId: event.discountId));
  //   final result = await discountDetailsUseCase.addBatchResources(
  //       discountId: event.discountId,
  //       conditionId: event.conditionId,
  //       itemIds: event.itemIds);
  //   result.when((discount) => emit(_Discount(discount)),
  //       (error) => emit(_Error(error)));
  // }
  //
  // Future<void> _removeItemsFromCondition(
  //   _RemoveItemsFromCondition event,
  //   Emitter<PromotionCrudState> emit,
  // ) async {
  //   emit(_Loading(discountId: event.discountId));
  //   final result = await discountDetailsUseCase.deleteBatchResources(
  //       discountId: event.discountId,
  //       conditionId: event.conditionId,
  //       itemIds: event.itemIds);
  //   result.when((discount) => emit(_Discount(discount)),
  //       (error) => emit(_Error(error)));
  // }

  final PromotionCrudUseCase discountDetailsUseCase;
  static PromotionCrudBloc get instance => getIt<PromotionCrudBloc>();
  static int pageSize = 20;
}
