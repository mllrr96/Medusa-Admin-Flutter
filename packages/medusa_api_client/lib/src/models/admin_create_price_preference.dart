/// AdminCreatePricePreference
/// {
///     "properties": {
///         "attribute": {
///             "type": "string",
///             "description": "The name of the attribute the price preference applies on.",
///             "title": "attribute"
///         },
///         "value": {
///             "type": "string",
///             "description": "The attribute's value.",
///             "title": "value"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the price is tax inclusive if the value of the specified attribute matches the specified value.",
///             "title": "is_tax_inclusive"
///         }
///     },
///     "type": "object",
///     "description": "The price preference's details."
/// }
library;

import 'exports.dart';
part 'admin_create_price_preference.freezed.dart';
part 'admin_create_price_preference.g.dart'; // AdminCreatePricePreference

@freezed
abstract class AdminCreatePricePreference with _$AdminCreatePricePreference {
  const AdminCreatePricePreference._();

  @jsonSerializable
  const factory AdminCreatePricePreference({
    /// attribute
    @JsonKey(name: AdminCreatePricePreference.attributeKey)
    required String attribute,

    /// value
    @JsonKey(name: AdminCreatePricePreference.valueKey) required String value,

    /// isTaxInclusive
    @JsonKey(name: AdminCreatePricePreference.isTaxInclusiveKey)
    required bool isTaxInclusive,
  }) = _AdminCreatePricePreference;

  factory AdminCreatePricePreference.fromJson(Map<String, dynamic> json) =>
      _$AdminCreatePricePreferenceFromJson(json);

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';
}
