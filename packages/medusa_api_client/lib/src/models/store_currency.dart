/// StoreCurrency
/// {
///     "properties": {
///         "code": {
///             "type": "string",
///             "description": "The currency's code.",
///             "title": "code"
///         },
///         "symbol": {
///             "type": "string",
///             "description": "The currency's symbol.",
///             "title": "symbol"
///         },
///         "symbol_native": {
///             "type": "string",
///             "description": "The currency's symbol native.",
///             "title": "symbol_native"
///         },
///         "name": {
///             "type": "string",
///             "description": "The currency's name.",
///             "title": "name"
///         },
///         "decimal_digits": {
///             "type": "number",
///             "description": "The currency's decimal digits.",
///             "title": "decimal_digits"
///         },
///         "rounding": {
///             "type": "number",
///             "description": "The currency's rounding.",
///             "title": "rounding"
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
///         "code",
///         "symbol",
///         "symbol_native",
///         "name",
///         "decimal_digits",
///         "rounding",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The currency's details."
/// }
library;

import 'exports.dart';
part 'store_currency.freezed.dart';
part 'store_currency.g.dart'; // StoreCurrency

@freezed
abstract class StoreCurrency with _$StoreCurrency {
  const StoreCurrency._();

  @jsonSerializable
  const factory StoreCurrency({
    /// code
    @JsonKey(name: StoreCurrency.codeKey) required String code,

    /// symbol
    @JsonKey(name: StoreCurrency.symbolKey) required String symbol,

    /// symbolNative
    @JsonKey(name: StoreCurrency.symbolNativeKey) required String symbolNative,

    /// name
    @JsonKey(name: StoreCurrency.nameKey) required String name,

    /// decimalDigits
    @JsonKey(name: StoreCurrency.decimalDigitsKey)
    required double decimalDigits,

    /// rounding
    @JsonKey(name: StoreCurrency.roundingKey) required double rounding,

    /// createdAt
    @JsonKey(name: StoreCurrency.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCurrency.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreCurrency.deletedAtKey) required DateTime deletedAt,
  }) = _StoreCurrency;

  factory StoreCurrency.fromJson(Map<String, dynamic> json) =>
      _$StoreCurrencyFromJson(json);

  static const String codeKey = r'code';

  static const String symbolKey = r'symbol';

  static const String symbolNativeKey = r'symbol_native';

  static const String nameKey = r'name';

  static const String decimalDigitsKey = r'decimal_digits';

  static const String roundingKey = r'rounding';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
