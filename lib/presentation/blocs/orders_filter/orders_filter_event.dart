part of 'orders_filter_bloc.dart';

@freezed
class OrdersFilterEvent with _$OrdersFilterEvent {
  const factory OrdersFilterEvent.loadFilters() = _LoadFilters;
}
