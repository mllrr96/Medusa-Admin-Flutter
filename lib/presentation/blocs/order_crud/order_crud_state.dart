part of 'order_crud_bloc.dart';

@freezed
class OrderCrudState with _$OrderCrudState {
  const factory OrderCrudState.initial() = _Initial;
  const factory OrderCrudState.loading() = _Loading;
  const factory OrderCrudState.order(Order order) = _Order;
  const factory OrderCrudState.error(Failure failure) = _Error;
}
