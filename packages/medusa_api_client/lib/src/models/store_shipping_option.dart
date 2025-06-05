/// StoreShippingOption
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
///                 "flat",
///                 "calculated"
///             ],
///             "type": "string",
///             "description": "The shipping option's price type. If it's `flat`, the price is fixed and is set in the `prices` property. If it's `calculated`, the price is calculated on checkout by the associated fulfillment provider."
///         },
///         "service_zone_id": {
///             "type": "string",
///             "description": "The ID of the service zone the shipping option belongs to.",
///             "title": "service_zone_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment provider handling this option.",
///             "title": "provider_id"
///         },
///         "provider": {
///             "$ref": "#/components/schemas/BaseFulfillmentProvider"
///         },
///         "shipping_option_type_id": {
///             "type": "string",
///             "description": "The ID of the shipping option's type.",
///             "title": "shipping_option_type_id"
///         },
///         "type": {
///             "$ref": "#/components/schemas/StoreShippingOptionType"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping profile.",
///             "title": "shipping_profile_id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The shipping option's amount.",
///             "title": "amount"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the amount includes taxes.",
///             "title": "is_tax_inclusive"
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping option's data, useful for the provider handling fulfillment."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping option's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "price_type",
///         "service_zone_id",
///         "provider_id",
///         "provider",
///         "shipping_option_type_id",
///         "type",
///         "shipping_profile_id",
///         "amount",
///         "is_tax_inclusive",
///         "data",
///         "metadata"
///     ],
///     "description": "The shipping option's details."
/// }
library;

import 'exports.dart';
part 'store_shipping_option.freezed.dart';
part 'store_shipping_option.g.dart'; // StoreShippingOption

@freezed
abstract class StoreShippingOption with _$StoreShippingOption {
  const StoreShippingOption._();

  @jsonSerializable
  const factory StoreShippingOption({
    /// id
    @JsonKey(name: StoreShippingOption.idKey) required String id,

    /// name
    @JsonKey(name: StoreShippingOption.nameKey) required String name,

    /// priceType
    @JsonKey(name: StoreShippingOption.priceTypeKey)
    required NullEnum priceType,

    /// serviceZoneId
    @JsonKey(name: StoreShippingOption.serviceZoneIdKey)
    required String serviceZoneId,

    /// providerId
    @JsonKey(name: StoreShippingOption.providerIdKey)
    required String providerId,

    /// provider
    @JsonKey(name: StoreShippingOption.providerKey)
    required BaseFulfillmentProvider provider,

    /// shippingOptionTypeId
    @JsonKey(name: StoreShippingOption.shippingOptionTypeIdKey)
    required String shippingOptionTypeId,

    /// type
    @JsonKey(name: StoreShippingOption.typeKey)
    required StoreShippingOptionType type,

    /// shippingProfileId
    @JsonKey(name: StoreShippingOption.shippingProfileIdKey)
    required String shippingProfileId,

    /// amount
    @JsonKey(name: StoreShippingOption.amountKey) required double amount,

    /// isTaxInclusive
    @JsonKey(name: StoreShippingOption.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// data
    @JsonKey(name: StoreShippingOption.dataKey)
    required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: StoreShippingOption.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreShippingOption;

  factory StoreShippingOption.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingOptionFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String priceTypeKey = r'price_type';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String providerIdKey = r'provider_id';

  static const String providerKey = r'provider';

  static const String shippingOptionTypeIdKey = r'shipping_option_type_id';

  static const String typeKey = r'type';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String amountKey = r'amount';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String dataKey = r'data';

  static const String metadataKey = r'metadata';
}
