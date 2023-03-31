import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/inventory_item.dart';
import '../store/location_level.dart';

class UserInventoryItemRes {
  final InventoryItem? inventoryItem;

  UserInventoryItemRes(this.inventoryItem);
  factory UserInventoryItemRes.fromJson(Map<String, dynamic> json) {
    return UserInventoryItemRes(json['inventory_item'] != null ? InventoryItem.fromJson(json['inventory_item']) : null);
  }
}

class UserInventoryItemsRes extends PaginatedResponse {
  List<InventoryItem>? inventoryItems;

  UserInventoryItemsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['inventory_items'] == null) return;
    inventoryItems = <InventoryItem>[];
    json['inventory_items'].forEach((v) => inventoryItems!.add(InventoryItem.fromJson(v)));
  }
}

class UserStockLevelsOfLocationRes {
  /// List of stock levels at a given location
  final List<LocationLevel>? locationLevels;

  /// The id of the location
  final String? id;

  UserStockLevelsOfLocationRes({
    this.id,
    this.locationLevels,
  });

  factory UserStockLevelsOfLocationRes.fromJson(Map<String, dynamic> json) {
    List<LocationLevel>? locationLevels;

    if (json['location_levels'] != null) {
      locationLevels = <LocationLevel>[];
      json['location_levels']?.forEach((v) => locationLevels?.add(LocationLevel.fromJson(v)));
    }

    return UserStockLevelsOfLocationRes(
      id: json['id'],
      locationLevels: locationLevels,
    );
  }
}

class UserDeleteInventoryItemRes {
  /// The ID of the deleted Inventory Item.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "inventory_item"
  final String? object;

  /// Whether or not the Inventory Item was deleted.
  final bool deleted;
  UserDeleteInventoryItemRes({required this.deleted, this.id, this.object});
  factory UserDeleteInventoryItemRes.fromJson(json) {
    return UserDeleteInventoryItemRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
