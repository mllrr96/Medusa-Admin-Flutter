/// AdminProductType
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
library admin_product_type;

import 'exports.dart';
part 'admin_product_type.freezed.dart';
part 'admin_product_type.g.dart'; // AdminProductType

@freezed
abstract class AdminProductType with _$AdminProductType {
  const AdminProductType._();

  @jsonSerializable
  const factory AdminProductType({
    /// id
    @JsonKey(name: AdminProductType.idKey) required String id,

    /// value
    @JsonKey(name: AdminProductType.valueKey) required String value,

    /// createdAt
    @JsonKey(name: AdminProductType.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProductType.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminProductType.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: AdminProductType.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminProductType;

  factory AdminProductType.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTypeFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
