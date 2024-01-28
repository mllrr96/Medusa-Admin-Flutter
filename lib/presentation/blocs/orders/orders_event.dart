part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.loadOrders(
      {Map<String, dynamic>? queryParameters}) = _LoadOrders;
}
