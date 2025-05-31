/// AdminCreateShippingOption
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The shipping option's name.",
///             "title": "name"
///         },
///         "service_zone_id": {
///             "type": "string",
///             "description": "The ID of the associated service zone.",
///             "title": "service_zone_id"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping profile.",
///             "title": "shipping_profile_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping option's data, useful for the fulfillment provider handling its processing."
///         },
///         "price_type": {
///             "enum": [
///                 "flat",
///                 "calculated"
///             ],
///             "type": "string",
///             "description": "The shipping option's price type. If `flat`, the shipping option has a fixed price set in `prices`. Otherwise, the shipping option's price is calculated by the fulfillment provider."
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment provider handling this shipping option.",
///             "title": "provider_id"
///         },
///         "type": {
///             "$ref": "#/components/schemas/AdminCreateShippingOptionType"
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "oneOf": [
///                     {
///                         "type": "object",
///                         "description": "The price's details."
///                     },
///                     {
///                         "type": "object",
///                         "description": "The price's details."
///                     }
///                 ]
///             },
///             "description": "The shipping option's prices."
///         },
///         "rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateShippingOptionRule"
///             },
///             "description": "The shipping option's rules."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name",
///         "service_zone_id",
///         "shipping_profile_id",
///         "price_type",
///         "provider_id",
///         "type",
///         "prices"
///     ],
///     "description": "The shipping option's details."
/// }
library;

import 'exports.dart';
part 'admin_create_shipping_option.freezed.dart';
part 'admin_create_shipping_option.g.dart'; // AdminCreateShippingOption

@freezed
abstract class AdminCreateShippingOption with _$AdminCreateShippingOption {
  const AdminCreateShippingOption._();

  @jsonSerializable
  const factory AdminCreateShippingOption({
    /// name
    @JsonKey(name: AdminCreateShippingOption.nameKey) required String name,

    /// serviceZoneId
    @JsonKey(name: AdminCreateShippingOption.serviceZoneIdKey)
    required String serviceZoneId,

    /// shippingProfileId
    @JsonKey(name: AdminCreateShippingOption.shippingProfileIdKey)
    required String shippingProfileId,

    /// data
    @JsonKey(name: AdminCreateShippingOption.dataKey)
    required Map<String, dynamic> data,

    /// priceType
    @JsonKey(name: AdminCreateShippingOption.priceTypeKey)
    required NullEnum priceType,

    /// providerId
    @JsonKey(name: AdminCreateShippingOption.providerIdKey)
    required String providerId,

    /// type
    @JsonKey(name: AdminCreateShippingOption.typeKey)
    required AdminCreateShippingOptionType type,

    /// prices
    @JsonKey(name: AdminCreateShippingOption.pricesKey)
    required List<dynamic> prices,

    /// rules
    @JsonKey(name: AdminCreateShippingOption.rulesKey)
    required List<AdminCreateShippingOptionRule> rules,
  }) = _AdminCreateShippingOption;

  factory AdminCreateShippingOption.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateShippingOptionFromJson(json);

  static const String nameKey = r'name';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String dataKey = r'data';

  static const String priceTypeKey = r'price_type';

  static const String providerIdKey = r'provider_id';

  static const String typeKey = r'type';

  static const String pricesKey = r'prices';

  static const String rulesKey = r'rules';
}
