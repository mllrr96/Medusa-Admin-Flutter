/// BaseProductTag
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
library base_product_tag;

import 'exports.dart';
part 'base_product_tag.freezed.dart';
part 'base_product_tag.g.dart'; // BaseProductTag

@freezed
abstract class BaseProductTag with _$BaseProductTag {
  const BaseProductTag._();

  @jsonSerializable
  const factory BaseProductTag({
    /// id
    @JsonKey(name: BaseProductTag.idKey) required String id,

    /// value
    @JsonKey(name: BaseProductTag.valueKey) required String value,

    /// createdAt
    @JsonKey(name: BaseProductTag.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductTag.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductTag.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: BaseProductTag.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _BaseProductTag;

  factory BaseProductTag.fromJson(Map<String, dynamic> json) =>
      _$BaseProductTagFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
