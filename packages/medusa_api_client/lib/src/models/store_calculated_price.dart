/// StoreCalculatedPrice
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The ID of the price set from which the price was selected.",
///             "title": "id"
///         },
///         "is_calculated_price_price_list": {
///             "type": "boolean",
///             "description": "Whether the calculated price belongs to a price list.",
///             "title": "is_calculated_price_price_list"
///         },
///         "is_calculated_price_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the calculated price is tax inclusive.",
///             "title": "is_calculated_price_tax_inclusive"
///         },
///         "calculated_amount": {
///             "type": "number",
///             "description": "The amount of the calculated price, or `null` if there isn't a calculated price. This is the amount shown to the customer.",
///             "title": "calculated_amount"
///         },
///         "calculated_amount_with_tax": {
///             "type": "number",
///             "description": "The `calculated_amount` with taxes applied.",
///             "title": "calculated_amount_with_tax"
///         },
///         "calculated_amount_without_tax": {
///             "type": "number",
///             "description": "The `calculated_amount` without taxes applied.",
///             "title": "calculated_amount_without_tax"
///         },
///         "is_original_price_price_list": {
///             "type": "boolean",
///             "description": "Whether the original price belongs to a price list.",
///             "title": "is_original_price_price_list"
///         },
///         "is_original_price_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the original price is tax inclusive.",
///             "title": "is_original_price_tax_inclusive"
///         },
///         "original_amount": {
///             "type": "number",
///             "description": "The amount of the original price, or `null` if there isn't an original price. This amount is useful to compare with the `calculated_amount`, such as to check for discounted value.",
///             "title": "original_amount"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The currency code of the calculated price, or `null` if there isn't a calculated price.",
///             "title": "currency_code"
///         },
///         "calculated_price": {
///             "type": "object",
///             "description": "The calculated price's details."
///         },
///         "original_price": {
///             "type": "object",
///             "description": "The origin price's details."
///         },
///         "original_amount_with_tax": {
///             "type": "number",
///             "description": "The original amount with taxes applied.",
///             "title": "original_amount_with_tax"
///         },
///         "original_amount_without_tax": {
///             "type": "number",
///             "description": "The original amount without taxes.",
///             "title": "original_amount_without_tax"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "calculated_amount",
///         "original_amount",
///         "original_amount_with_tax",
///         "original_amount_without_tax",
///         "currency_code"
///     ],
///     "description": "The shipping option's calculated price."
/// }
library;

import 'exports.dart';
part 'store_calculated_price.freezed.dart';
part 'store_calculated_price.g.dart'; // StoreCalculatedPrice

@freezed
abstract class StoreCalculatedPrice with _$StoreCalculatedPrice {
  const StoreCalculatedPrice._();

  @jsonSerializable
  const factory StoreCalculatedPrice({
    /// id
    @JsonKey(name: StoreCalculatedPrice.idKey) required String id,

    /// isCalculatedPricePriceList
    @JsonKey(name: StoreCalculatedPrice.isCalculatedPricePriceListKey)
    required bool isCalculatedPricePriceList,

    /// isCalculatedPriceTaxInclusive
    @JsonKey(name: StoreCalculatedPrice.isCalculatedPriceTaxInclusiveKey)
    required bool isCalculatedPriceTaxInclusive,

    /// calculatedAmount
    @JsonKey(name: StoreCalculatedPrice.calculatedAmountKey)
    required double calculatedAmount,

    /// calculatedAmountWithTax
    @JsonKey(name: StoreCalculatedPrice.calculatedAmountWithTaxKey)
    required double calculatedAmountWithTax,

    /// calculatedAmountWithoutTax
    @JsonKey(name: StoreCalculatedPrice.calculatedAmountWithoutTaxKey)
    required double calculatedAmountWithoutTax,

    /// isOriginalPricePriceList
    @JsonKey(name: StoreCalculatedPrice.isOriginalPricePriceListKey)
    required bool isOriginalPricePriceList,

    /// isOriginalPriceTaxInclusive
    @JsonKey(name: StoreCalculatedPrice.isOriginalPriceTaxInclusiveKey)
    required bool isOriginalPriceTaxInclusive,

    /// originalAmount
    @JsonKey(name: StoreCalculatedPrice.originalAmountKey)
    required double originalAmount,

    /// currencyCode
    @JsonKey(name: StoreCalculatedPrice.currencyCodeKey)
    required String currencyCode,

    /// calculatedPrice
    @JsonKey(name: StoreCalculatedPrice.calculatedPriceKey)
    required Map<String, dynamic> calculatedPrice,

    /// originalPrice
    @JsonKey(name: StoreCalculatedPrice.originalPriceKey)
    required Map<String, dynamic> originalPrice,

    /// originalAmountWithTax
    @JsonKey(name: StoreCalculatedPrice.originalAmountWithTaxKey)
    required double originalAmountWithTax,

    /// originalAmountWithoutTax
    @JsonKey(name: StoreCalculatedPrice.originalAmountWithoutTaxKey)
    required double originalAmountWithoutTax,
  }) = _StoreCalculatedPrice;

  factory StoreCalculatedPrice.fromJson(Map<String, dynamic> json) =>
      _$StoreCalculatedPriceFromJson(json);

  static const String idKey = r'id';

  static const String isCalculatedPricePriceListKey =
      r'is_calculated_price_price_list';

  static const String isCalculatedPriceTaxInclusiveKey =
      r'is_calculated_price_tax_inclusive';

  static const String calculatedAmountKey = r'calculated_amount';

  static const String calculatedAmountWithTaxKey =
      r'calculated_amount_with_tax';

  static const String calculatedAmountWithoutTaxKey =
      r'calculated_amount_without_tax';

  static const String isOriginalPricePriceListKey =
      r'is_original_price_price_list';

  static const String isOriginalPriceTaxInclusiveKey =
      r'is_original_price_tax_inclusive';

  static const String originalAmountKey = r'original_amount';

  static const String currencyCodeKey = r'currency_code';

  static const String calculatedPriceKey = r'calculated_price';

  static const String originalPriceKey = r'original_price';

  static const String originalAmountWithTaxKey = r'original_amount_with_tax';

  static const String originalAmountWithoutTaxKey =
      r'original_amount_without_tax';
}
