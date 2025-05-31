/// AdminUpdatePricePreference
/// {
///     "properties": {
///         "attribute": {
///             "type": "string",
///             "description": "The price preference's attribute.",
///             "title": "attribute"
///         },
///         "value": {
///             "type": "string",
///             "description": "The price preference's value.",
///             "title": "value"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether prices are tax inclusive for this price preference.",
///             "title": "is_tax_inclusive"
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the price preference."
/// }
library;

import 'exports.dart';
part 'admin_update_price_preference.freezed.dart';
part 'admin_update_price_preference.g.dart'; // AdminUpdatePricePreference

@freezed
abstract class AdminUpdatePricePreference with _$AdminUpdatePricePreference {
  const AdminUpdatePricePreference._();

  @jsonSerializable
  const factory AdminUpdatePricePreference({
    /// attribute
    @JsonKey(name: AdminUpdatePricePreference.attributeKey)
    required String attribute,

    /// value
    @JsonKey(name: AdminUpdatePricePreference.valueKey) required String value,

    /// isTaxInclusive
    @JsonKey(name: AdminUpdatePricePreference.isTaxInclusiveKey)
    required bool isTaxInclusive,
  }) = _AdminUpdatePricePreference;

  factory AdminUpdatePricePreference.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdatePricePreferenceFromJson(json);

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';
}
