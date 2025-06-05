/// StoreProductOptionValue
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
///         "value",
///         "id"
///     ],
///     "description": "The product option value's details."
/// }
library;

import 'exports.dart';
part 'store_product_option_value.freezed.dart';
part 'store_product_option_value.g.dart'; // StoreProductOptionValue

@freezed
abstract class StoreProductOptionValue with _$StoreProductOptionValue {
  const StoreProductOptionValue._();

  @jsonSerializable
  const factory StoreProductOptionValue({
    /// id
    @JsonKey(name: StoreProductOptionValue.idKey) required String id,

    /// value
    @JsonKey(name: StoreProductOptionValue.valueKey) required String value,

    /// option
    @JsonKey(name: StoreProductOptionValue.optionKey)
    required Map<String, dynamic> option,

    /// optionId
    @JsonKey(name: StoreProductOptionValue.optionIdKey)
    required String optionId,

    /// metadata
    @JsonKey(name: StoreProductOptionValue.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreProductOptionValue.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductOptionValue.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductOptionValue.deletedAtKey)
    required DateTime deletedAt,
  }) = _StoreProductOptionValue;

  factory StoreProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$StoreProductOptionValueFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String optionKey = r'option';

  static const String optionIdKey = r'option_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
