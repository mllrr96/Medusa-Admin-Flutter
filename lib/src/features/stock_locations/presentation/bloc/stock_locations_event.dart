part of 'stock_locations_bloc.dart';

@freezed
class StockLocationsEvent with _$StockLocationsEvent {
  const factory StockLocationsEvent.load({Map<String, dynamic>? queryParameters}) = _Load;

  const factory StockLocationsEvent.create(CreateStockLocation payload) = _Create;

  const factory StockLocationsEvent.retrieve(String id, {Map<String, dynamic>? query}) = _Retrieve;

  const factory StockLocationsEvent.update(String id, UpdateStockLocation payload) = _Update;

  const factory StockLocationsEvent.delete(String id) = _Delete;
}
