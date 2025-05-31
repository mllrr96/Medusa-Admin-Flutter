/// AdminProductTag
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tag's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The tag's value.",
///             "title": "value"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tag was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tag was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tag was deleted.",
///             "title": "deleted_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tag's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The product tag's details."
/// }
library admin_product_tag;

import 'exports.dart';
part 'admin_product_tag.freezed.dart';
part 'admin_product_tag.g.dart'; // AdminProductTag

@freezed
abstract class AdminProductTag with _$AdminProductTag {
  const AdminProductTag._();

  @jsonSerializable
  const factory AdminProductTag({
    /// id
    @JsonKey(name: AdminProductTag.idKey) required String id,

    /// value
    @JsonKey(name: AdminProductTag.valueKey) required String value,

    /// createdAt
    @JsonKey(name: AdminProductTag.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProductTag.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminProductTag.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: AdminProductTag.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminProductTag;

  factory AdminProductTag.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTagFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
