/// AdminStockLocation
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The location's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The location's name.",
///             "title": "name"
///         },
///         "address_id": {
///             "type": "string",
///             "description": "The ID of the associated address.",
///             "title": "address_id"
///         },
///         "address": {
///             "$ref": "#/components/schemas/AdminStockLocationAddress"
///         },
///         "sales_channels": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminSalesChannel"
///             },
///             "description": "The sales channels associated with the location."
///         },
///         "fulfillment_providers": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFulfillmentProvider"
///             },
///             "description": "The fulfillment providers associated with the location."
///         },
///         "fulfillment_sets": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The fulfillment sets associated with the location."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "address_id"
///     ],
///     "description": "The stock location's details."
/// }
library;

import 'exports.dart';
part 'admin_stock_location.freezed.dart';
part 'admin_stock_location.g.dart'; // AdminStockLocation

@freezed
abstract class AdminStockLocation with _$AdminStockLocation {
  const AdminStockLocation._();

  @jsonSerializable
  const factory AdminStockLocation({
    /// id
    @JsonKey(name: AdminStockLocation.idKey) required String id,

    /// name
    @JsonKey(name: AdminStockLocation.nameKey) required String name,

    /// addressId
    @JsonKey(name: AdminStockLocation.addressIdKey) required String addressId,

    /// address
    @JsonKey(name: AdminStockLocation.addressKey)
    required AdminStockLocationAddress address,

    /// salesChannels
    @JsonKey(name: AdminStockLocation.salesChannelsKey)
    required List<AdminSalesChannel> salesChannels,

    /// fulfillmentProviders
    @JsonKey(name: AdminStockLocation.fulfillmentProvidersKey)
    required List<AdminFulfillmentProvider> fulfillmentProviders,

    /// fulfillmentSets
    @JsonKey(name: AdminStockLocation.fulfillmentSetsKey)
    required List<Map<String, dynamic>> fulfillmentSets,
  }) = _AdminStockLocation;

  factory AdminStockLocation.fromJson(Map<String, dynamic> json) =>
      _$AdminStockLocationFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String addressIdKey = r'address_id';

  static const String addressKey = r'address';

  static const String salesChannelsKey = r'sales_channels';

  static const String fulfillmentProvidersKey = r'fulfillment_providers';

  static const String fulfillmentSetsKey = r'fulfillment_sets';
}
