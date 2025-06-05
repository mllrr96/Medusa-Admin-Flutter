/// AdminUpdateStore
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The store's name.",
///             "title": "name"
///         },
///         "supported_currencies": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A store currency."
///             },
///             "description": "The store's supported currencies."
///         },
///         "default_sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the default sales channel in the store.",
///             "title": "default_sales_channel_id"
///         },
///         "default_region_id": {
///             "type": "string",
///             "description": "The ID of the default region in the store.",
///             "title": "default_region_id"
///         },
///         "default_location_id": {
///             "type": "string",
///             "description": "The ID of the default stock location in the store.",
///             "title": "default_location_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The store's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The properties to update in a store."
/// }
library;

import 'exports.dart';
part 'admin_update_store.freezed.dart';
part 'admin_update_store.g.dart'; // AdminUpdateStore

@freezed
abstract class AdminUpdateStore with _$AdminUpdateStore {
  const AdminUpdateStore._();

  @jsonSerializable
  const factory AdminUpdateStore({
    /// name
    @JsonKey(name: AdminUpdateStore.nameKey) required String name,

    /// supportedCurrencies
    @JsonKey(name: AdminUpdateStore.supportedCurrenciesKey)
    required List<Map<String, dynamic>> supportedCurrencies,

    /// defaultSalesChannelId
    @JsonKey(name: AdminUpdateStore.defaultSalesChannelIdKey)
    required String defaultSalesChannelId,

    /// defaultRegionId
    @JsonKey(name: AdminUpdateStore.defaultRegionIdKey)
    required String defaultRegionId,

    /// defaultLocationId
    @JsonKey(name: AdminUpdateStore.defaultLocationIdKey)
    required String defaultLocationId,

    /// metadata
    @JsonKey(name: AdminUpdateStore.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateStore;

  factory AdminUpdateStore.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateStoreFromJson(json);

  static const String nameKey = r'name';

  static const String supportedCurrenciesKey = r'supported_currencies';

  static const String defaultSalesChannelIdKey = r'default_sales_channel_id';

  static const String defaultRegionIdKey = r'default_region_id';

  static const String defaultLocationIdKey = r'default_location_id';

  static const String metadataKey = r'metadata';
}
