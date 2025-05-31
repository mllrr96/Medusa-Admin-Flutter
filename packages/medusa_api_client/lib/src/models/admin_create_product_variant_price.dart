/// AdminCreateProductVariantPrice
/// {
///     "properties": {
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
///         "min_quantity": {
///             "type": "number",
///             "description": "The minimum quantity that must be available in the cart for this price to apply.",
///             "title": "min_quantity"
///         },
///         "max_quantity": {
///             "type": "number",
///             "description": "The maximum quantity that must not be surpassed in the cart for this price to apply.",
///             "title": "max_quantity"
///         },
///         "rules": {
///             "type": "object",
///             "description": "The price's rules."
///         }
///     },
///     "type": "object",
///     "required": [
///         "currency_code",
///         "amount"
///     ],
///     "description": "The details of a variant's price."
/// }
library;

import 'exports.dart';
part 'admin_create_product_variant_price.freezed.dart';
part 'admin_create_product_variant_price.g.dart'; // AdminCreateProductVariantPrice

@freezed
abstract class AdminCreateProductVariantPrice
    with _$AdminCreateProductVariantPrice {
  const AdminCreateProductVariantPrice._();

  @jsonSerializable
  const factory AdminCreateProductVariantPrice({
    /// currencyCode
    @JsonKey(name: AdminCreateProductVariantPrice.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: AdminCreateProductVariantPrice.amountKey)
    required double amount,

    /// minQuantity
    @JsonKey(name: AdminCreateProductVariantPrice.minQuantityKey)
    required double minQuantity,

    /// maxQuantity
    @JsonKey(name: AdminCreateProductVariantPrice.maxQuantityKey)
    required double maxQuantity,

    /// rules
    @JsonKey(name: AdminCreateProductVariantPrice.rulesKey)
    required Map<String, dynamic> rules,
  }) = _AdminCreateProductVariantPrice;

  factory AdminCreateProductVariantPrice.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductVariantPriceFromJson(json);

  static const String currencyCodeKey = r'currency_code';

  static const String amountKey = r'amount';

  static const String minQuantityKey = r'min_quantity';

  static const String maxQuantityKey = r'max_quantity';

  static const String rulesKey = r'rules';
}
