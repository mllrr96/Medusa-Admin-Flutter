part of 'inventory_bloc.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.inventoryItemsList(InventoryItemsListRes inventoryItems) = _InventoryItemsList;
  const factory InventoryState.inventoryItem(InventoryItemRes inventoryItem) = _InventoryItem;
  const factory InventoryState.batchInventoryItemsRes(BatchInventoryItemsLocationLevelsRes batchInventoryItems) = _BatchInventoryItemsRes;
  const factory InventoryState.deleted() = _Deleted;
  const factory InventoryState.error(MedusaError failure) = _Error;
}
