part of 'orders_filter_bloc.dart';

@freezed
class OrdersFilterState with _$OrdersFilterState {
  const factory OrdersFilterState.initial() = _Initial;
  const factory OrdersFilterState.loading() = _Loading;
  const factory OrdersFilterState.loaded(List<Region> regions, List<SalesChannel> salesChannels) = _Loaded;
  const factory OrdersFilterState.error(Failure failure) = _Error;
}
