part of 'draft_order_crud_bloc.dart';

@freezed
class DraftOrderCrudState with _$DraftOrderCrudState {
  const factory DraftOrderCrudState.initial() = _Initial;
  const factory DraftOrderCrudState.loading() = _Loading;
  const factory DraftOrderCrudState.paymentRegistered() = _PaymentRegistered;
  const factory DraftOrderCrudState.draftOrder(DraftOrder draftOrder) =
      _DraftOrder;
  const factory DraftOrderCrudState.error(Failure error) = _Error;
  const factory DraftOrderCrudState.deleted() = _Deleted;
}
