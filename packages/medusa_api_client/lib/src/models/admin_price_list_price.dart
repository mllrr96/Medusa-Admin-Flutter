/// AdminPriceListPrice
/// {
///     "properties": {
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the product variant this price list is for.",
///             "title": "variant_id"
///         },
///         "rules": {
///             "type": "object",
///             "description": "The price's rules."
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
///             "description": "The minimum quantity that must be available in the cart for the price to be applied.",
///             "title": "min_quantity"
///         },
///         "max_quantity": {
///             "type": "number",
///             "description": "The maximum quantity allowed to be available in the cart for the price to be applied.",
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
///         "variant_id",
///         "rules",
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
///     "description": "The details of a price list's price."
/// }
library admin_price_list_price;

import 'exports.dart';
part 'admin_price_list_price.freezed.dart';
part 'admin_price_list_price.g.dart'; // AdminPriceListPrice

@freezed
abstract class AdminPriceListPrice with _$AdminPriceListPrice {
  const AdminPriceListPrice._();

  @jsonSerializable
  const factory AdminPriceListPrice({
    /// variantId
    @JsonKey(name: AdminPriceListPrice.variantIdKey) required String variantId,

    /// rules
    @JsonKey(name: AdminPriceListPrice.rulesKey)
    required Map<String, dynamic> rules,

    /// id
    @JsonKey(name: AdminPriceListPrice.idKey) required String id,

    /// title
    @JsonKey(name: AdminPriceListPrice.titleKey) required String title,

    /// currencyCode
    @JsonKey(name: AdminPriceListPrice.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: AdminPriceListPrice.amountKey) required double amount,

    /// rawAmount
    @JsonKey(name: AdminPriceListPrice.rawAmountKey)
    required Map<String, dynamic> rawAmount,

    /// minQuantity
    @JsonKey(name: AdminPriceListPrice.minQuantityKey)
    required double minQuantity,

    /// maxQuantity
    @JsonKey(name: AdminPriceListPrice.maxQuantityKey)
    required double maxQuantity,

    /// priceSetId
    @JsonKey(name: AdminPriceListPrice.priceSetIdKey)
    required String priceSetId,

    /// createdAt
    @JsonKey(name: AdminPriceListPrice.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPriceListPrice.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminPriceListPrice.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminPriceListPrice;

  factory AdminPriceListPrice.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListPriceFromJson(json);

  static const String variantIdKey = r'variant_id';

  static const String rulesKey = r'rules';

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
