/// AdminFulfillment
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The fulfillment's ID.",
///             "title": "id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the fulfillment's items are shipped from.",
///             "title": "location_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment provider handling this fulfillment.",
///             "title": "provider_id"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option this fulfillment is created for.",
///             "title": "shipping_option_id"
///         },
///         "provider": {
///             "$ref": "#/components/schemas/AdminFulfillmentProvider"
///         },
///         "delivery_address": {
///             "$ref": "#/components/schemas/AdminFulfillmentAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFulfillmentItem"
///             },
///             "description": "The fulfillment's items."
///         },
///         "labels": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFulfillmentLabel"
///             },
///             "description": "The fulfillment's shipment labels."
///         },
///         "packed_at": {
///             "type": "string",
///             "description": "The date the fulfillment was packed at.",
///             "title": "packed_at"
///         },
///         "shipped_at": {
///             "type": "string",
///             "description": "The date the fulfillment was shipped at.",
///             "title": "shipped_at"
///         },
///         "delivered_at": {
///             "type": "string",
///             "description": "The date the fulfillment was delivered at.",
///             "title": "delivered_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "description": "The date the fulfillment was canceled at.",
///             "title": "canceled_at"
///         },
///         "data": {
///             "type": "object",
///             "description": "The fulfillment's data, useful for the third-party provider handling the fulfillment."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The fulfillment's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the fulfillment was created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the fulfillment was updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the fulfillment was deleted at.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "location_id",
///         "provider_id",
///         "shipping_option_id",
///         "provider",
///         "delivery_address",
///         "items",
///         "labels",
///         "packed_at",
///         "shipped_at",
///         "delivered_at",
///         "canceled_at",
///         "data",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The fulfillment's details."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment.freezed.dart';
part 'admin_fulfillment.g.dart'; // AdminFulfillment

@freezed
abstract class AdminFulfillment with _$AdminFulfillment {
  const AdminFulfillment._();

  @jsonSerializable
  const factory AdminFulfillment({
    /// id
    @JsonKey(name: AdminFulfillment.idKey) required String id,

    /// locationId
    @JsonKey(name: AdminFulfillment.locationIdKey) required String locationId,

    /// providerId
    @JsonKey(name: AdminFulfillment.providerIdKey) required String providerId,

    /// shippingOptionId
    @JsonKey(name: AdminFulfillment.shippingOptionIdKey)
    required String shippingOptionId,

    /// provider
    @JsonKey(name: AdminFulfillment.providerKey)
    required AdminFulfillmentProvider provider,

    /// deliveryAddress
    @JsonKey(name: AdminFulfillment.deliveryAddressKey)
    required AdminFulfillmentAddress deliveryAddress,

    /// items
    @JsonKey(name: AdminFulfillment.itemsKey)
    required List<AdminFulfillmentItem> items,

    /// labels
    @JsonKey(name: AdminFulfillment.labelsKey)
    required List<AdminFulfillmentLabel> labels,

    /// packedAt
    @JsonKey(name: AdminFulfillment.packedAtKey) required String packedAt,

    /// shippedAt
    @JsonKey(name: AdminFulfillment.shippedAtKey) required String shippedAt,

    /// deliveredAt
    @JsonKey(name: AdminFulfillment.deliveredAtKey) required String deliveredAt,

    /// canceledAt
    @JsonKey(name: AdminFulfillment.canceledAtKey) required String canceledAt,

    /// data
    @JsonKey(name: AdminFulfillment.dataKey) required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: AdminFulfillment.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminFulfillment.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminFulfillment.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminFulfillment.deletedAtKey) required DateTime deletedAt,
  }) = _AdminFulfillment;

  factory AdminFulfillment.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentFromJson(json);

  static const String idKey = r'id';

  static const String locationIdKey = r'location_id';

  static const String providerIdKey = r'provider_id';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String providerKey = r'provider';

  static const String deliveryAddressKey = r'delivery_address';

  static const String itemsKey = r'items';

  static const String labelsKey = r'labels';

  static const String packedAtKey = r'packed_at';

  static const String shippedAtKey = r'shipped_at';

  static const String deliveredAtKey = r'delivered_at';

  static const String canceledAtKey = r'canceled_at';

  static const String dataKey = r'data';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
