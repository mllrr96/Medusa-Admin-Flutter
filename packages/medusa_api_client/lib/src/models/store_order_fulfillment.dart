/// StoreOrderFulfillment
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The fulfillment's ID.",
///             "title": "id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the items are fulfilled from.",
///             "title": "location_id"
///         },
///         "packed_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the items were packed.",
///             "title": "packed_at"
///         },
///         "shipped_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the items were shipped.",
///             "title": "shipped_at"
///         },
///         "delivered_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the items were delivered.",
///             "title": "delivered_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the items were canceled.",
///             "title": "canceled_at"
///         },
///         "data": {
///             "type": "object",
///             "description": "Data useful for the fulfillment provider handling it. This is taken from the associated shipping option."
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment provider used to handle the fulfillment.",
///             "title": "provider_id"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The fulfillment's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the fulfillment was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the fulfillment was updated.",
///             "title": "updated_at"
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "The fulfillment's requires shipping.",
///             "title": "requires_shipping"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "location_id",
///         "packed_at",
///         "shipped_at",
///         "delivered_at",
///         "canceled_at",
///         "requires_shipping",
///         "data",
///         "provider_id",
///         "shipping_option_id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The fulfillment's details."
/// }
library store_order_fulfillment;

import 'exports.dart';
part 'store_order_fulfillment.freezed.dart';
part 'store_order_fulfillment.g.dart'; // StoreOrderFulfillment

@freezed
abstract class StoreOrderFulfillment with _$StoreOrderFulfillment {
  const StoreOrderFulfillment._();

  @jsonSerializable
  const factory StoreOrderFulfillment({
    /// id
    @JsonKey(name: StoreOrderFulfillment.idKey) required String id,

    /// locationId
    @JsonKey(name: StoreOrderFulfillment.locationIdKey)
    required String locationId,

    /// packedAt
    @JsonKey(name: StoreOrderFulfillment.packedAtKey)
    required DateTime packedAt,

    /// shippedAt
    @JsonKey(name: StoreOrderFulfillment.shippedAtKey)
    required DateTime shippedAt,

    /// deliveredAt
    @JsonKey(name: StoreOrderFulfillment.deliveredAtKey)
    required DateTime deliveredAt,

    /// canceledAt
    @JsonKey(name: StoreOrderFulfillment.canceledAtKey)
    required DateTime canceledAt,

    /// data
    @JsonKey(name: StoreOrderFulfillment.dataKey)
    required Map<String, dynamic> data,

    /// providerId
    @JsonKey(name: StoreOrderFulfillment.providerIdKey)
    required String providerId,

    /// shippingOptionId
    @JsonKey(name: StoreOrderFulfillment.shippingOptionIdKey)
    required String shippingOptionId,

    /// metadata
    @JsonKey(name: StoreOrderFulfillment.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreOrderFulfillment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreOrderFulfillment.updatedAtKey)
    required DateTime updatedAt,

    /// requiresShipping
    @JsonKey(name: StoreOrderFulfillment.requiresShippingKey)
    required bool requiresShipping,
  }) = _StoreOrderFulfillment;

  factory StoreOrderFulfillment.fromJson(Map<String, dynamic> json) =>
      _$StoreOrderFulfillmentFromJson(json);

  static const String idKey = r'id';

  static const String locationIdKey = r'location_id';

  static const String packedAtKey = r'packed_at';

  static const String shippedAtKey = r'shipped_at';

  static const String deliveredAtKey = r'delivered_at';

  static const String canceledAtKey = r'canceled_at';

  static const String dataKey = r'data';

  static const String providerIdKey = r'provider_id';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String requiresShippingKey = r'requires_shipping';
}
