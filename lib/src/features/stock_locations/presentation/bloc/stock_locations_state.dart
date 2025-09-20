part of 'stock_locations_bloc.dart';

@freezed
class StockLocationsState with _$StockLocationsState {
  const factory StockLocationsState.initial() = _Initial;
  const factory StockLocationsState.loading() = _Loading;
  const factory StockLocationsState.stockLocations(StockLocationListResponse stockLocations) = _StockLocations;
  const factory StockLocationsState.stockLocation(StockLocation stockLocation) = _StockLocation;
  const factory StockLocationsState.deleted() = _Deleted;
  const factory StockLocationsState.error(MedusaError error) = _Error;
}
