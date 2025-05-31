/// StoreCartShippingOption
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
///             "type": "object",
///             "description": "The fulfillment provider's details."
///         },
///         "type": {
///             "type": "object",
///             "description": "The shipping option type's details."
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
///         "data": {
///             "type": "object",
///             "description": "The shipping option's data, useful for the provider handling fulfillment."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StorePrice"
///             },
///             "description": "The shipping option's prices."
///         },
///         "calculated_price": {
///             "$ref": "#/components/schemas/StoreCalculatedPrice"
///         },
///         "insufficient_inventory": {
///             "type": "boolean",
///             "description": "Whether the shipping option's location doesn't have sufficient quantity for any of the cart's items.",
///             "title": "insufficient_inventory"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "price_type",
///         "service_zone_id",
///         "shipping_profile_id",
///         "provider_id",
///         "data",
///         "type",
///         "provider",
///         "amount",
///         "prices",
///         "calculated_price",
///         "insufficient_inventory"
///     ],
///     "description": "The shipping option's details."
/// }
library store_cart_shipping_option;

import 'exports.dart';
part 'store_cart_shipping_option.freezed.dart';
part 'store_cart_shipping_option.g.dart'; // StoreCartShippingOption

@freezed
abstract class StoreCartShippingOption with _$StoreCartShippingOption {
  const StoreCartShippingOption._();

  @jsonSerializable
  const factory StoreCartShippingOption({
    /// id
    @JsonKey(name: StoreCartShippingOption.idKey) required String id,

    /// name
    @JsonKey(name: StoreCartShippingOption.nameKey) required String name,

    /// priceType
    @JsonKey(name: StoreCartShippingOption.priceTypeKey)
    required NullEnum priceType,

    /// serviceZoneId
    @JsonKey(name: StoreCartShippingOption.serviceZoneIdKey)
    required String serviceZoneId,

    /// providerId
    @JsonKey(name: StoreCartShippingOption.providerIdKey)
    required String providerId,

    /// provider
    @JsonKey(name: StoreCartShippingOption.providerKey)
    required Map<String, dynamic> provider,

    /// type
    @JsonKey(name: StoreCartShippingOption.typeKey)
    required Map<String, dynamic> type,

    /// shippingProfileId
    @JsonKey(name: StoreCartShippingOption.shippingProfileIdKey)
    required String shippingProfileId,

    /// amount
    @JsonKey(name: StoreCartShippingOption.amountKey) required double amount,

    /// data
    @JsonKey(name: StoreCartShippingOption.dataKey)
    required Map<String, dynamic> data,

    /// prices
    @JsonKey(name: StoreCartShippingOption.pricesKey)
    required List<StorePrice> prices,

    /// calculatedPrice
    @JsonKey(name: StoreCartShippingOption.calculatedPriceKey)
    required StoreCalculatedPrice calculatedPrice,

    /// insufficientInventory
    @JsonKey(name: StoreCartShippingOption.insufficientInventoryKey)
    required bool insufficientInventory,
  }) = _StoreCartShippingOption;

  factory StoreCartShippingOption.fromJson(Map<String, dynamic> json) =>
      _$StoreCartShippingOptionFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String priceTypeKey = r'price_type';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String providerIdKey = r'provider_id';

  static const String providerKey = r'provider';

  static const String typeKey = r'type';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String amountKey = r'amount';

  static const String dataKey = r'data';

  static const String pricesKey = r'prices';

  static const String calculatedPriceKey = r'calculated_price';

  static const String insufficientInventoryKey = r'insufficient_inventory';
}
