/// AdminUpdateStockLocation
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The stock location's name.",
///             "title": "name"
///         },
///         "address": {
///             "type": "object",
///             "description": "The stock location's address. Pass this property if you're creating a new address to associate with the location."
///         },
///         "address_id": {
///             "type": "string",
///             "description": "The ID of an existing stock location address to associate the stock location with.",
///             "title": "address_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The stock location's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The properties to update in a stock location."
/// }
library admin_update_stock_location;

import 'exports.dart';
part 'admin_update_stock_location.freezed.dart';
part 'admin_update_stock_location.g.dart'; // AdminUpdateStockLocation

@freezed
abstract class AdminUpdateStockLocation with _$AdminUpdateStockLocation {
  const AdminUpdateStockLocation._();

  @jsonSerializable
  const factory AdminUpdateStockLocation({
    /// name
    @JsonKey(name: AdminUpdateStockLocation.nameKey) required String name,

    /// address
    @JsonKey(name: AdminUpdateStockLocation.addressKey)
    required Map<String, dynamic> address,

    /// addressId
    @JsonKey(name: AdminUpdateStockLocation.addressIdKey)
    required String addressId,

    /// metadata
    @JsonKey(name: AdminUpdateStockLocation.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateStockLocation;

  factory AdminUpdateStockLocation.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateStockLocationFromJson(json);

  static const String nameKey = r'name';

  static const String addressKey = r'address';

  static const String addressIdKey = r'address_id';

  static const String metadataKey = r'metadata';
}
