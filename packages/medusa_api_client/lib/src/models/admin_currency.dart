/// AdminCurrency
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
///             "description": "The currency's native symbol, if different than the symbol.",
///             "title": "symbol_native"
///         },
///         "name": {
///             "type": "string",
///             "description": "The currency's name.",
///             "title": "name"
///         },
///         "decimal_digits": {
///             "type": "number",
///             "description": "The number of digits after the decimal for prices in this currency.",
///             "title": "decimal_digits"
///         },
///         "rounding": {
///             "type": "number",
///             "description": "The rounding percision applied on prices in this currency.",
///             "title": "rounding"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The currency's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The currency's update date.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The currency's deletion date.",
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
///     "description": "The currency's currencies."
/// }
library admin_currency;

import 'exports.dart';
part 'admin_currency.freezed.dart';
part 'admin_currency.g.dart'; // AdminCurrency

@freezed
abstract class AdminCurrency with _$AdminCurrency {
  const AdminCurrency._();

  @jsonSerializable
  const factory AdminCurrency({
    /// code
    @JsonKey(name: AdminCurrency.codeKey) required String code,

    /// symbol
    @JsonKey(name: AdminCurrency.symbolKey) required String symbol,

    /// symbolNative
    @JsonKey(name: AdminCurrency.symbolNativeKey) required String symbolNative,

    /// name
    @JsonKey(name: AdminCurrency.nameKey) required String name,

    /// decimalDigits
    @JsonKey(name: AdminCurrency.decimalDigitsKey)
    required double decimalDigits,

    /// rounding
    @JsonKey(name: AdminCurrency.roundingKey) required double rounding,

    /// createdAt
    @JsonKey(name: AdminCurrency.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCurrency.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminCurrency.deletedAtKey) required DateTime deletedAt,
  }) = _AdminCurrency;

  factory AdminCurrency.fromJson(Map<String, dynamic> json) =>
      _$AdminCurrencyFromJson(json);

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
