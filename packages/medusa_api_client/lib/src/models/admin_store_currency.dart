/// AdminStoreCurrency
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The currency's ID.",
///             "title": "id"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The currency's code.",
///             "title": "currency_code"
///         },
///         "store_id": {
///             "type": "string",
///             "description": "The ID of the store this currency belongs to.",
///             "title": "store_id"
///         },
///         "is_default": {
///             "type": "boolean",
///             "description": "Whether this currency is the default in the store.",
///             "title": "is_default"
///         },
///         "currency": {
///             "$ref": "#/components/schemas/AdminCurrency"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the currency was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the currency was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the currency was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "currency_code",
///         "store_id",
///         "is_default",
///         "currency",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The details of a store's currency."
/// }
library;

import 'exports.dart';
part 'admin_store_currency.freezed.dart';
part 'admin_store_currency.g.dart'; // AdminStoreCurrency

@freezed
abstract class AdminStoreCurrency with _$AdminStoreCurrency {
  const AdminStoreCurrency._();

  @jsonSerializable
  const factory AdminStoreCurrency({
    /// id
    @JsonKey(name: AdminStoreCurrency.idKey) required String id,

    /// currencyCode
    @JsonKey(name: AdminStoreCurrency.currencyCodeKey)
    required String currencyCode,

    /// storeId
    @JsonKey(name: AdminStoreCurrency.storeIdKey) required String storeId,

    /// isDefault
    @JsonKey(name: AdminStoreCurrency.isDefaultKey) required bool isDefault,

    /// currency
    @JsonKey(name: AdminStoreCurrency.currencyKey)
    required AdminCurrency currency,

    /// createdAt
    @JsonKey(name: AdminStoreCurrency.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminStoreCurrency.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminStoreCurrency.deletedAtKey) required DateTime deletedAt,
  }) = _AdminStoreCurrency;

  factory AdminStoreCurrency.fromJson(Map<String, dynamic> json) =>
      _$AdminStoreCurrencyFromJson(json);

  static const String idKey = r'id';

  static const String currencyCodeKey = r'currency_code';

  static const String storeIdKey = r'store_id';

  static const String isDefaultKey = r'is_default';

  static const String currencyKey = r'currency';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
