/// AdminShippingOptionPrice
/// {
///     "properties": {
///         "price_rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminShippingOptionPriceRule"
///             },
///             "description": "The price's rules."
///         },
///         "rules_count": {
///             "type": "number",
///             "description": "The number of rules the price has.",
///             "title": "rules_count"
///         },
///         "id": {
///             "type": "string",
///             "description": "The price's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The price's title.",
///             "title": "title"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The price's currency code.",
///             "title": "currency_code"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The price's amount.",
///             "title": "amount"
///         },
///         "raw_amount": {
///             "type": "object",
///             "description": "The price's raw amount."
///         },
///         "min_quantity": {
///             "type": "number",
///             "description": "The minimum quantity required in the cart for this price to apply.",
///             "title": "min_quantity"
///         },
///         "max_quantity": {
///             "type": "number",
///             "description": "The maximum quantity that the cart's items must not surpass for this price to apply.",
///             "title": "max_quantity"
///         },
///         "price_set_id": {
///             "type": "string",
///             "description": "The ID of the price set this price belongs to.",
///             "title": "price_set_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "price_rules",
///         "rules_count",
///         "id",
///         "title",
///         "currency_code",
///         "amount",
///         "raw_amount",
///         "min_quantity",
///         "max_quantity",
///         "price_set_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The details of the shipping option's price."
/// }
library;

import 'exports.dart';
part 'admin_shipping_option_price.freezed.dart';
part 'admin_shipping_option_price.g.dart'; // AdminShippingOptionPrice

@freezed
abstract class AdminShippingOptionPrice with _$AdminShippingOptionPrice {
  const AdminShippingOptionPrice._();

  @jsonSerializable
  const factory AdminShippingOptionPrice({
    /// priceRules
    @JsonKey(name: AdminShippingOptionPrice.priceRulesKey)
    required List<AdminShippingOptionPriceRule> priceRules,

    /// rulesCount
    @JsonKey(name: AdminShippingOptionPrice.rulesCountKey)
    required double rulesCount,

    /// id
    @JsonKey(name: AdminShippingOptionPrice.idKey) required String id,

    /// title
    @JsonKey(name: AdminShippingOptionPrice.titleKey) required String title,

    /// currencyCode
    @JsonKey(name: AdminShippingOptionPrice.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: AdminShippingOptionPrice.amountKey) required double amount,

    /// rawAmount
    @JsonKey(name: AdminShippingOptionPrice.rawAmountKey)
    required Map<String, dynamic> rawAmount,

    /// minQuantity
    @JsonKey(name: AdminShippingOptionPrice.minQuantityKey)
    required double minQuantity,

    /// maxQuantity
    @JsonKey(name: AdminShippingOptionPrice.maxQuantityKey)
    required double maxQuantity,

    /// priceSetId
    @JsonKey(name: AdminShippingOptionPrice.priceSetIdKey)
    required String priceSetId,

    /// createdAt
    @JsonKey(name: AdminShippingOptionPrice.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingOptionPrice.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingOptionPrice.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminShippingOptionPrice;

  factory AdminShippingOptionPrice.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionPriceFromJson(json);

  static const String priceRulesKey = r'price_rules';

  static const String rulesCountKey = r'rules_count';

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String currencyCodeKey = r'currency_code';

  static const String amountKey = r'amount';

  static const String rawAmountKey = r'raw_amount';

  static const String minQuantityKey = r'min_quantity';

  static const String maxQuantityKey = r'max_quantity';

  static const String priceSetIdKey = r'price_set_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
