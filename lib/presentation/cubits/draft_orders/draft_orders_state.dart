part of 'draft_orders_cubit.dart';

@freezed
class DraftOrdersState with _$DraftOrdersState {
  const factory DraftOrdersState.initial() = _Initial;
  const factory DraftOrdersState.loading() = _Loading;
  const factory DraftOrdersState.draftOrders(List<DraftOrder> draftOrders) = _DraftOrders;
  const factory DraftOrdersState.error(Failure failure) = _Error;
}
