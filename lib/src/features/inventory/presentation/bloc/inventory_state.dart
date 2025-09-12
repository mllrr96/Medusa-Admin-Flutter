part of 'inventory_bloc.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.loaded() = _Loaded;
  const factory InventoryState.error(MedusaError failure) = _Error;
}