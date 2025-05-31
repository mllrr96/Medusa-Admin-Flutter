/// AdminShippingOption
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping option's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The shipping option's name.",
///             "title": "name"
///         },
///         "price_type": {
///             "enum": [
///                 "calculated",
///                 "flat"
///             ],
///             "type": "string",
///             "description": "The shipping option's price type. If it's `flat`, the price is fixed and is set in the `prices` property. If it's `calculated`, the price is calculated on checkout by the associated fulfillment provider."
///         },
///         "service_zone_id": {
///             "type": "string",
///             "description": "The ID of the service zone this option belongs to.",
///             "title": "service_zone_id"
///         },
///         "service_zone": {
///             "type": "object"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the provider handling fulfillments created from this shipping option.",
///             "title": "provider_id"
///         },
///         "provider": {
///             "$ref": "#/components/schemas/AdminFulfillmentProvider"
///         },
///         "shipping_option_type_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option type.",
///             "title": "shipping_option_type_id"
///         },
///         "type": {
///             "$ref": "#/components/schemas/AdminShippingOptionType"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping profile.",
///             "title": "shipping_profile_id"
///         },
///         "shipping_profile": {
///             "$ref": "#/components/schemas/AdminShippingProfile"
///         },
///         "rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminShippingOptionRule"
///             },
///             "description": "The shipping option's rules."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminShippingOptionPrice"
///             },
///             "description": "The shipping option's prices. If the `price_type` is `calculated`, this array will be empty since the price is calculated by the fulfillment provider during checkout."
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping option's data, useful for the fulfillment provider handling fulfillments created from this option."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping option's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "price_type",
///         "service_zone_id",
///         "service_zone",
///         "provider_id",
///         "provider",
///         "shipping_option_type_id",
///         "type",
///         "shipping_profile_id",
///         "shipping_profile",
///         "rules",
///         "prices",
///         "data",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The shipping option's details."
/// }
library admin_shipping_option;

import 'exports.dart';
part 'admin_shipping_option.freezed.dart';
part 'admin_shipping_option.g.dart'; // AdminShippingOption

@freezed
abstract class AdminShippingOption with _$AdminShippingOption {
  const AdminShippingOption._();

  @jsonSerializable
  const factory AdminShippingOption({
    /// id
    @JsonKey(name: AdminShippingOption.idKey) required String id,

    /// name
    @JsonKey(name: AdminShippingOption.nameKey) required String name,

    /// priceType
    @JsonKey(name: AdminShippingOption.priceTypeKey)
    required NullEnum priceType,

    /// serviceZoneId
    @JsonKey(name: AdminShippingOption.serviceZoneIdKey)
    required String serviceZoneId,

    /// serviceZone
    @JsonKey(name: AdminShippingOption.serviceZoneKey)
    required Map<String, dynamic> serviceZone,

    /// providerId
    @JsonKey(name: AdminShippingOption.providerIdKey)
    required String providerId,

    /// provider
    @JsonKey(name: AdminShippingOption.providerKey)
    required AdminFulfillmentProvider provider,

    /// shippingOptionTypeId
    @JsonKey(name: AdminShippingOption.shippingOptionTypeIdKey)
    required String shippingOptionTypeId,

    /// type
    @JsonKey(name: AdminShippingOption.typeKey)
    required AdminShippingOptionType type,

    /// shippingProfileId
    @JsonKey(name: AdminShippingOption.shippingProfileIdKey)
    required String shippingProfileId,

    /// shippingProfile
    @JsonKey(name: AdminShippingOption.shippingProfileKey)
    required AdminShippingProfile shippingProfile,

    /// rules
    @JsonKey(name: AdminShippingOption.rulesKey)
    required List<AdminShippingOptionRule> rules,

    /// prices
    @JsonKey(name: AdminShippingOption.pricesKey)
    required List<AdminShippingOptionPrice> prices,

    /// data
    @JsonKey(name: AdminShippingOption.dataKey)
    required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: AdminShippingOption.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminShippingOption.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingOption.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingOption.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminShippingOption;

  factory AdminShippingOption.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String priceTypeKey = r'price_type';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String serviceZoneKey = r'service_zone';

  static const String providerIdKey = r'provider_id';

  static const String providerKey = r'provider';

  static const String shippingOptionTypeIdKey = r'shipping_option_type_id';

  static const String typeKey = r'type';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String shippingProfileKey = r'shipping_profile';

  static const String rulesKey = r'rules';

  static const String pricesKey = r'prices';

  static const String dataKey = r'data';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
