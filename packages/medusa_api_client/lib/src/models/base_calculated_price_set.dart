/// BaseCalculatedPriceSet
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The calculated price's ID.",
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
///             "description": "The calculated price's amount with taxes applied.",
///             "title": "calculated_amount_with_tax"
///         },
///         "calculated_amount_without_tax": {
///             "type": "number",
///             "description": "The calculated price's amount without taxes applied.",
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
///             "description": "The calculated price's currency code.",
///             "title": "currency_code"
///         },
///         "calculated_price": {
///             "type": "object",
///             "description": "The calculated price's details."
///         },
///         "original_price": {
///             "type": "object",
///             "description": "The original price's details."
///         },
///         "original_amount_with_tax": {
///             "type": "number",
///             "description": "The amount of the original price with taxes applied.",
///             "title": "original_amount_with_tax"
///         },
///         "original_amount_without_tax": {
///             "type": "number",
///             "description": "The amount of the original price without taxes.",
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
///     "description": "The calculated price's details."
/// }
library;

import 'exports.dart';
part 'base_calculated_price_set.freezed.dart';
part 'base_calculated_price_set.g.dart'; // BaseCalculatedPriceSet

@freezed
abstract class BaseCalculatedPriceSet with _$BaseCalculatedPriceSet {
  const BaseCalculatedPriceSet._();

  @jsonSerializable
  const factory BaseCalculatedPriceSet({
    /// id
    @JsonKey(name: BaseCalculatedPriceSet.idKey) required String id,

    /// isCalculatedPricePriceList
    @JsonKey(name: BaseCalculatedPriceSet.isCalculatedPricePriceListKey)
    required bool isCalculatedPricePriceList,

    /// isCalculatedPriceTaxInclusive
    @JsonKey(name: BaseCalculatedPriceSet.isCalculatedPriceTaxInclusiveKey)
    required bool isCalculatedPriceTaxInclusive,

    /// calculatedAmount
    @JsonKey(name: BaseCalculatedPriceSet.calculatedAmountKey)
    required double calculatedAmount,

    /// calculatedAmountWithTax
    @JsonKey(name: BaseCalculatedPriceSet.calculatedAmountWithTaxKey)
    required double calculatedAmountWithTax,

    /// calculatedAmountWithoutTax
    @JsonKey(name: BaseCalculatedPriceSet.calculatedAmountWithoutTaxKey)
    required double calculatedAmountWithoutTax,

    /// isOriginalPricePriceList
    @JsonKey(name: BaseCalculatedPriceSet.isOriginalPricePriceListKey)
    required bool isOriginalPricePriceList,

    /// isOriginalPriceTaxInclusive
    @JsonKey(name: BaseCalculatedPriceSet.isOriginalPriceTaxInclusiveKey)
    required bool isOriginalPriceTaxInclusive,

    /// originalAmount
    @JsonKey(name: BaseCalculatedPriceSet.originalAmountKey)
    required double originalAmount,

    /// currencyCode
    @JsonKey(name: BaseCalculatedPriceSet.currencyCodeKey)
    required String currencyCode,

    /// calculatedPrice
    @JsonKey(name: BaseCalculatedPriceSet.calculatedPriceKey)
    required Map<String, dynamic> calculatedPrice,

    /// originalPrice
    @JsonKey(name: BaseCalculatedPriceSet.originalPriceKey)
    required Map<String, dynamic> originalPrice,

    /// originalAmountWithTax
    @JsonKey(name: BaseCalculatedPriceSet.originalAmountWithTaxKey)
    required double originalAmountWithTax,

    /// originalAmountWithoutTax
    @JsonKey(name: BaseCalculatedPriceSet.originalAmountWithoutTaxKey)
    required double originalAmountWithoutTax,
  }) = _BaseCalculatedPriceSet;

  factory BaseCalculatedPriceSet.fromJson(Map<String, dynamic> json) =>
      _$BaseCalculatedPriceSetFromJson(json);

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
