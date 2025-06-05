/// AdminPrice
/// {
///     "properties": {
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
///             "description": "The ID of the associated price set.",
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
///     "description": "The price's details."
/// }
library;

import 'exports.dart';
part 'admin_price.freezed.dart';
part 'admin_price.g.dart'; // AdminPrice

@freezed
abstract class AdminPrice with _$AdminPrice {
  const AdminPrice._();

  @jsonSerializable
  const factory AdminPrice({
    /// id
    @JsonKey(name: AdminPrice.idKey) required String id,

    /// title
    @JsonKey(name: AdminPrice.titleKey) required String title,

    /// currencyCode
    @JsonKey(name: AdminPrice.currencyCodeKey) required String currencyCode,

    /// amount
    @JsonKey(name: AdminPrice.amountKey) required double amount,

    /// rawAmount
    @JsonKey(name: AdminPrice.rawAmountKey)
    required Map<String, dynamic> rawAmount,

    /// minQuantity
    @JsonKey(name: AdminPrice.minQuantityKey) required double minQuantity,

    /// maxQuantity
    @JsonKey(name: AdminPrice.maxQuantityKey) required double maxQuantity,

    /// priceSetId
    @JsonKey(name: AdminPrice.priceSetIdKey) required String priceSetId,

    /// createdAt
    @JsonKey(name: AdminPrice.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPrice.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminPrice.deletedAtKey) required DateTime deletedAt,
  }) = _AdminPrice;

  factory AdminPrice.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceFromJson(json);

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
