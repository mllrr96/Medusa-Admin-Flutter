/// BaseProductImage
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The image's ID.",
///             "title": "id"
///         },
///         "url": {
///             "type": "string",
///             "description": "The image's URL.",
///             "title": "url"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the image was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the image was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the image was deleted.",
///             "title": "deleted_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The image's metadata, can hold custom key-value pairs."
///         },
///         "rank": {
///             "type": "number",
///             "description": "The image's rank among its sibling images.",
///             "title": "rank"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "url",
///         "rank"
///     ],
///     "description": "The image's details."
/// }
library;

import 'exports.dart';
part 'base_product_image.freezed.dart';
part 'base_product_image.g.dart'; // BaseProductImage

@freezed
abstract class BaseProductImage with _$BaseProductImage {
  const BaseProductImage._();

  @jsonSerializable
  const factory BaseProductImage({
    /// id
    @JsonKey(name: BaseProductImage.idKey) required String id,

    /// url
    @JsonKey(name: BaseProductImage.urlKey) required String url,

    /// createdAt
    @JsonKey(name: BaseProductImage.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductImage.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductImage.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: BaseProductImage.metadataKey)
    required Map<String, dynamic> metadata,

    /// rank
    @JsonKey(name: BaseProductImage.rankKey) required double rank,
  }) = _BaseProductImage;

  factory BaseProductImage.fromJson(Map<String, dynamic> json) =>
      _$BaseProductImageFromJson(json);

  static const String idKey = r'id';

  static const String urlKey = r'url';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';

  static const String rankKey = r'rank';
}
