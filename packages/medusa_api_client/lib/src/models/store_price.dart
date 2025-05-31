/// StorePrice
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price's ID.",
///             "title": "id"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The price's ISO 2 currency code.",
///             "title": "currency_code"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The price's amount.",
///             "title": "amount"
///         },
///         "min_quantity": {
///             "type": "number",
///             "description": "The minimum quantity required in the cart for the price to apply.",
///             "title": "min_quantity"
///         },
///         "max_quantity": {
///             "type": "number",
///             "description": "The maximum quantity required in the cart for the price to apply.",
///             "title": "max_quantity"
///         },
///         "price_rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StorePriceRule"
///             },
///             "description": "The price's rules."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "currency_code",
///         "amount",
///         "min_quantity",
///         "max_quantity"
///     ],
///     "description": "The price's details."
/// }
library store_price;

import 'exports.dart';
part 'store_price.freezed.dart';
part 'store_price.g.dart'; // StorePrice

@freezed
abstract class StorePrice with _$StorePrice {
  const StorePrice._();

  @jsonSerializable
  const factory StorePrice({
    /// id
    @JsonKey(name: StorePrice.idKey) required String id,

    /// currencyCode
    @JsonKey(name: StorePrice.currencyCodeKey) required String currencyCode,

    /// amount
    @JsonKey(name: StorePrice.amountKey) required double amount,

    /// minQuantity
    @JsonKey(name: StorePrice.minQuantityKey) required double minQuantity,

    /// maxQuantity
    @JsonKey(name: StorePrice.maxQuantityKey) required double maxQuantity,

    /// priceRules
    @JsonKey(name: StorePrice.priceRulesKey)
    required List<StorePriceRule> priceRules,
  }) = _StorePrice;

  factory StorePrice.fromJson(Map<String, dynamic> json) =>
      _$StorePriceFromJson(json);

  static const String idKey = r'id';

  static const String currencyCodeKey = r'currency_code';

  static const String amountKey = r'amount';

  static const String minQuantityKey = r'min_quantity';

  static const String maxQuantityKey = r'max_quantity';

  static const String priceRulesKey = r'price_rules';
}
