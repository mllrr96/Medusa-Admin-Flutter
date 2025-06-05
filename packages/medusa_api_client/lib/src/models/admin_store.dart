/// AdminStore
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The store's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The store's name.",
///             "title": "name"
///         },
///         "supported_currencies": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminStoreCurrency"
///             },
///             "description": "The store's supported currencies."
///         },
///         "default_sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel used by default in the store.",
///             "title": "default_sales_channel_id"
///         },
///         "default_region_id": {
///             "type": "string",
///             "description": "The ID of the region used by default in the store.",
///             "title": "default_region_id"
///         },
///         "default_location_id": {
///             "type": "string",
///             "description": "The ID of the stock location used by default in the store.",
///             "title": "default_location_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The store's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the store was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the store was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "supported_currencies",
///         "default_sales_channel_id",
///         "default_region_id",
///         "default_location_id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The store's details."
/// }
library;

import 'exports.dart';
part 'admin_store.freezed.dart';
part 'admin_store.g.dart'; // AdminStore

@freezed
abstract class AdminStore with _$AdminStore {
  const AdminStore._();

  @jsonSerializable
  const factory AdminStore({
    /// id
    @JsonKey(name: AdminStore.idKey) required String id,

    /// name
    @JsonKey(name: AdminStore.nameKey) required String name,

    /// supportedCurrencies
    @JsonKey(name: AdminStore.supportedCurrenciesKey)
    required List<AdminStoreCurrency> supportedCurrencies,

    /// defaultSalesChannelId
    @JsonKey(name: AdminStore.defaultSalesChannelIdKey)
    required String defaultSalesChannelId,

    /// defaultRegionId
    @JsonKey(name: AdminStore.defaultRegionIdKey)
    required String defaultRegionId,

    /// defaultLocationId
    @JsonKey(name: AdminStore.defaultLocationIdKey)
    required String defaultLocationId,

    /// metadata
    @JsonKey(name: AdminStore.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminStore.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminStore.updatedAtKey) required DateTime updatedAt,
  }) = _AdminStore;

  factory AdminStore.fromJson(Map<String, dynamic> json) =>
      _$AdminStoreFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String supportedCurrenciesKey = r'supported_currencies';

  static const String defaultSalesChannelIdKey = r'default_sales_channel_id';

  static const String defaultRegionIdKey = r'default_region_id';

  static const String defaultLocationIdKey = r'default_location_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
