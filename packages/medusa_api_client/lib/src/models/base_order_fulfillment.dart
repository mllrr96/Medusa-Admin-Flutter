/// BaseOrderFulfillment
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
///             "description": "Whether the fulfillment requires shipping.",
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
library;

import 'exports.dart';
part 'base_order_fulfillment.freezed.dart';
part 'base_order_fulfillment.g.dart'; // BaseOrderFulfillment

@freezed
abstract class BaseOrderFulfillment with _$BaseOrderFulfillment {
  const BaseOrderFulfillment._();

  @jsonSerializable
  const factory BaseOrderFulfillment({
    /// id
    @JsonKey(name: BaseOrderFulfillment.idKey) required String id,

    /// locationId
    @JsonKey(name: BaseOrderFulfillment.locationIdKey)
    required String locationId,

    /// packedAt
    @JsonKey(name: BaseOrderFulfillment.packedAtKey) required DateTime packedAt,

    /// shippedAt
    @JsonKey(name: BaseOrderFulfillment.shippedAtKey)
    required DateTime shippedAt,

    /// deliveredAt
    @JsonKey(name: BaseOrderFulfillment.deliveredAtKey)
    required DateTime deliveredAt,

    /// canceledAt
    @JsonKey(name: BaseOrderFulfillment.canceledAtKey)
    required DateTime canceledAt,

    /// data
    @JsonKey(name: BaseOrderFulfillment.dataKey)
    required Map<String, dynamic> data,

    /// providerId
    @JsonKey(name: BaseOrderFulfillment.providerIdKey)
    required String providerId,

    /// shippingOptionId
    @JsonKey(name: BaseOrderFulfillment.shippingOptionIdKey)
    required String shippingOptionId,

    /// metadata
    @JsonKey(name: BaseOrderFulfillment.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseOrderFulfillment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderFulfillment.updatedAtKey)
    required DateTime updatedAt,

    /// requiresShipping
    @JsonKey(name: BaseOrderFulfillment.requiresShippingKey)
    required bool requiresShipping,
  }) = _BaseOrderFulfillment;

  factory BaseOrderFulfillment.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderFulfillmentFromJson(json);

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
