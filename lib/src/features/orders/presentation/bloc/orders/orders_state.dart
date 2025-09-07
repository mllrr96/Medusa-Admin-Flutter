part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.orders(List<Order> orders, int count) = _Orders;
  const factory OrdersState.error(MedusaError error) = _Error;
}
