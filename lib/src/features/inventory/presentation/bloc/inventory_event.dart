part of 'inventory_bloc.dart';

@freezed
class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.load() = _Load;
  const factory InventoryEvent.createInventoryItem(InventoryItemCreateReq body) = _CreateInventoryItem;
  const factory InventoryEvent.batchInventoryItems(BatchInventoryItemLocationsLevelReq body) = _BatchInventoryItems;
  const factory InventoryEvent.retrieveInventoryItem(String id) = _RetrieveInventoryItem;
  const factory InventoryEvent.updateInventoryItem(String id, InventoryItemUpdateReq body) = _UpdateInventoryItem;
  const factory InventoryEvent.deleteInventoryItem(String id) = _DeleteInventoryItem;
  const factory InventoryEvent.listLocationLevels(String id) = _ListLocationLevels;
  const factory InventoryEvent.createLocationLevel(String id, CreateInventoryLocationLevelReq body) = _CreateLocationLevel;
  const factory InventoryEvent.batchLocationLevels(String id, BatchInventoryItemLocationsLevelReq body) = _BatchLocationLevels;
  const factory InventoryEvent.deleteLocationLevel(String id, String locationId) = _DeleteLocationLevel;
  const factory InventoryEvent.updateLocationLevel(String id, String locationId, UpdateInventoryLocationLevelReq body) = _UpdateLocationLevel;
}
