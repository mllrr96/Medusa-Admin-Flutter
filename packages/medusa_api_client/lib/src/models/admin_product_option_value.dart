/// AdminProductOptionValue
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The value's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The value.",
///             "title": "value"
///         },
///         "option": {
///             "$ref": "#/components/schemas/AdminProductOption"
///         },
///         "option_id": {
///             "type": "string",
///             "description": "The ID of the option this value belongs to.",
///             "title": "option_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The value's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the value was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the value was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the value was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value"
///     ],
///     "description": "The product option value's details."
/// }
library;

import 'exports.dart';
part 'admin_product_option_value.freezed.dart';
part 'admin_product_option_value.g.dart'; // AdminProductOptionValue

@freezed
abstract class AdminProductOptionValue with _$AdminProductOptionValue {
  const AdminProductOptionValue._();

  @jsonSerializable
  const factory AdminProductOptionValue({
    /// id
    @JsonKey(name: AdminProductOptionValue.idKey) required String id,

    /// value
    @JsonKey(name: AdminProductOptionValue.valueKey) required String value,

    /// option
    @JsonKey(name: AdminProductOptionValue.optionKey)
    required AdminProductOption option,

    /// optionId
    @JsonKey(name: AdminProductOptionValue.optionIdKey)
    required String optionId,

    /// metadata
    @JsonKey(name: AdminProductOptionValue.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminProductOptionValue.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProductOptionValue.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminProductOptionValue.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminProductOptionValue;

  factory AdminProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$AdminProductOptionValueFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String optionKey = r'option';

  static const String optionIdKey = r'option_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
