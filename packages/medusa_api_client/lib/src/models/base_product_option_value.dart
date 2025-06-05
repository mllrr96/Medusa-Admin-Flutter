/// BaseProductOptionValue
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
///             "type": "object"
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
part 'base_product_option_value.freezed.dart';
part 'base_product_option_value.g.dart'; // BaseProductOptionValue

@freezed
abstract class BaseProductOptionValue with _$BaseProductOptionValue {
  const BaseProductOptionValue._();

  @jsonSerializable
  const factory BaseProductOptionValue({
    /// id
    @JsonKey(name: BaseProductOptionValue.idKey) required String id,

    /// value
    @JsonKey(name: BaseProductOptionValue.valueKey) required String value,

    /// option
    @JsonKey(name: BaseProductOptionValue.optionKey)
    required Map<String, dynamic> option,

    /// optionId
    @JsonKey(name: BaseProductOptionValue.optionIdKey) required String optionId,

    /// metadata
    @JsonKey(name: BaseProductOptionValue.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseProductOptionValue.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductOptionValue.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductOptionValue.deletedAtKey)
    required DateTime deletedAt,
  }) = _BaseProductOptionValue;

  factory BaseProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$BaseProductOptionValueFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String optionKey = r'option';

  static const String optionIdKey = r'option_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
