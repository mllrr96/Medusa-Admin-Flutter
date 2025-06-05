/// BaseProductType
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The type's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The type's value.",
///             "title": "value"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was deleted.",
///             "title": "deleted_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The type's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The product type's details."
/// }
library;

import 'exports.dart';
part 'base_product_type.freezed.dart';
part 'base_product_type.g.dart'; // BaseProductType

@freezed
abstract class BaseProductType with _$BaseProductType {
  const BaseProductType._();

  @jsonSerializable
  const factory BaseProductType({
    /// id
    @JsonKey(name: BaseProductType.idKey) required String id,

    /// value
    @JsonKey(name: BaseProductType.valueKey) required String value,

    /// createdAt
    @JsonKey(name: BaseProductType.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductType.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductType.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: BaseProductType.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _BaseProductType;

  factory BaseProductType.fromJson(Map<String, dynamic> json) =>
      _$BaseProductTypeFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
