/// AdminCreateFulfillment
/// {
///     "properties": {
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the items are fulfilled from.",
///             "title": "location_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the provider handling this fulfillment.",
///             "title": "provider_id"
///         },
///         "delivery_address": {
///             "type": "object",
///             "description": "The address to deliver the items to."
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item to fulfill."
///             },
///             "description": "The items to fulfill."
///         },
///         "labels": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A shipment's label."
///             },
///             "description": "The labels for the fulfillment's shipments."
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this fulfillment is created for.",
///             "title": "order_id"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option used in the order.",
///             "title": "shipping_option_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "Any data useful for the fulfillment provider to handle the fulfillment."
///         },
///         "packed_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the fulfillment was packed.",
///             "title": "packed_at"
///         },
///         "shipped_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the fulfillment was shipped.",
///             "title": "shipped_at"
///         },
///         "delivered_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the fulfillment was delivered.",
///             "title": "delivered_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the fulfillment was canceled.",
///             "title": "canceled_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The fulfillment's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "data",
///         "items",
///         "metadata",
///         "order_id",
///         "location_id",
///         "provider_id",
///         "delivery_address",
///         "labels"
///     ],
///     "description": "The filfillment's details."
/// }
library admin_create_fulfillment;

import 'exports.dart';
part 'admin_create_fulfillment.freezed.dart';
part 'admin_create_fulfillment.g.dart'; // AdminCreateFulfillment

@freezed
abstract class AdminCreateFulfillment with _$AdminCreateFulfillment {
  const AdminCreateFulfillment._();

  @jsonSerializable
  const factory AdminCreateFulfillment({
    /// locationId
    @JsonKey(name: AdminCreateFulfillment.locationIdKey)
    required String locationId,

    /// providerId
    @JsonKey(name: AdminCreateFulfillment.providerIdKey)
    required String providerId,

    /// deliveryAddress
    @JsonKey(name: AdminCreateFulfillment.deliveryAddressKey)
    required Map<String, dynamic> deliveryAddress,

    /// items
    @JsonKey(name: AdminCreateFulfillment.itemsKey)
    required List<Map<String, dynamic>> items,

    /// labels
    @JsonKey(name: AdminCreateFulfillment.labelsKey)
    required List<Map<String, dynamic>> labels,

    /// orderId
    @JsonKey(name: AdminCreateFulfillment.orderIdKey) required String orderId,

    /// shippingOptionId
    @JsonKey(name: AdminCreateFulfillment.shippingOptionIdKey)
    required String shippingOptionId,

    /// data
    @JsonKey(name: AdminCreateFulfillment.dataKey)
    required Map<String, dynamic> data,

    /// packedAt
    @JsonKey(name: AdminCreateFulfillment.packedAtKey)
    required DateTime packedAt,

    /// shippedAt
    @JsonKey(name: AdminCreateFulfillment.shippedAtKey)
    required DateTime shippedAt,

    /// deliveredAt
    @JsonKey(name: AdminCreateFulfillment.deliveredAtKey)
    required DateTime deliveredAt,

    /// canceledAt
    @JsonKey(name: AdminCreateFulfillment.canceledAtKey)
    required DateTime canceledAt,

    /// metadata
    @JsonKey(name: AdminCreateFulfillment.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateFulfillment;

  factory AdminCreateFulfillment.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateFulfillmentFromJson(json);

  static const String locationIdKey = r'location_id';

  static const String providerIdKey = r'provider_id';

  static const String deliveryAddressKey = r'delivery_address';

  static const String itemsKey = r'items';

  static const String labelsKey = r'labels';

  static const String orderIdKey = r'order_id';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String dataKey = r'data';

  static const String packedAtKey = r'packed_at';

  static const String shippedAtKey = r'shipped_at';

  static const String deliveredAtKey = r'delivered_at';

  static const String canceledAtKey = r'canceled_at';

  static const String metadataKey = r'metadata';
}
