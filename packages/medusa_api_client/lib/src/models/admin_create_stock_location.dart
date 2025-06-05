/// AdminCreateStockLocation
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The stock location's name.",
///             "title": "name"
///         },
///         "address_id": {
///             "type": "string",
///             "description": "The ID of the stock location's address.",
///             "title": "address_id"
///         },
///         "address": {
///             "$ref": "#/components/schemas/AdminUpsertStockLocationAddress"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The stock location's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name"
///     ],
///     "description": "The stock location's details."
/// }
library;

import 'exports.dart';
part 'admin_create_stock_location.freezed.dart';
part 'admin_create_stock_location.g.dart'; // AdminCreateStockLocation

@freezed
abstract class AdminCreateStockLocation with _$AdminCreateStockLocation {
  const AdminCreateStockLocation._();

  @jsonSerializable
  const factory AdminCreateStockLocation({
    /// name
    @JsonKey(name: AdminCreateStockLocation.nameKey) required String name,

    /// addressId
    @JsonKey(name: AdminCreateStockLocation.addressIdKey)
    required String addressId,

    /// address
    @JsonKey(name: AdminCreateStockLocation.addressKey)
    required AdminUpsertStockLocationAddress address,

    /// metadata
    @JsonKey(name: AdminCreateStockLocation.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateStockLocation;

  factory AdminCreateStockLocation.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateStockLocationFromJson(json);

  static const String nameKey = r'name';

  static const String addressIdKey = r'address_id';

  static const String addressKey = r'address';

  static const String metadataKey = r'metadata';
}
