/// StoreProductTag
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
///     "description": "The tag's details."
/// }
library;

import 'exports.dart';
part 'store_product_tag.freezed.dart';
part 'store_product_tag.g.dart'; // StoreProductTag

@freezed
abstract class StoreProductTag with _$StoreProductTag {
  const StoreProductTag._();

  @jsonSerializable
  const factory StoreProductTag({
    /// id
    @JsonKey(name: StoreProductTag.idKey) required String id,

    /// value
    @JsonKey(name: StoreProductTag.valueKey) required String value,

    /// createdAt
    @JsonKey(name: StoreProductTag.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductTag.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductTag.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: StoreProductTag.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreProductTag;

  factory StoreProductTag.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTagFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
