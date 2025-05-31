/// AdminPricePreference
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price preference's ID.",
///             "title": "id"
///         },
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
///             "description": "Whether prices matching this preference include taxes.",
///             "title": "is_tax_inclusive"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price preference was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price preference was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price preference was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "attribute",
///         "value",
///         "is_tax_inclusive",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The price preference's details."
/// }
library admin_price_preference;

import 'exports.dart';
part 'admin_price_preference.freezed.dart';
part 'admin_price_preference.g.dart'; // AdminPricePreference

@freezed
abstract class AdminPricePreference with _$AdminPricePreference {
  const AdminPricePreference._();

  @jsonSerializable
  const factory AdminPricePreference({
    /// id
    @JsonKey(name: AdminPricePreference.idKey) required String id,

    /// attribute
    @JsonKey(name: AdminPricePreference.attributeKey) required String attribute,

    /// value
    @JsonKey(name: AdminPricePreference.valueKey) required String value,

    /// isTaxInclusive
    @JsonKey(name: AdminPricePreference.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// createdAt
    @JsonKey(name: AdminPricePreference.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPricePreference.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminPricePreference.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminPricePreference;

  factory AdminPricePreference.fromJson(Map<String, dynamic> json) =>
      _$AdminPricePreferenceFromJson(json);

  static const String idKey = r'id';

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
