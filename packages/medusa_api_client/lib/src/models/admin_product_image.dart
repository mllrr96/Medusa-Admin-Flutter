/// AdminProductImage
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
///             "description": "The image's rank among sibling images.",
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
library admin_product_image;

import 'exports.dart';
part 'admin_product_image.freezed.dart';
part 'admin_product_image.g.dart'; // AdminProductImage

@freezed
abstract class AdminProductImage with _$AdminProductImage {
  const AdminProductImage._();

  @jsonSerializable
  const factory AdminProductImage({
    /// id
    @JsonKey(name: AdminProductImage.idKey) required String id,

    /// url
    @JsonKey(name: AdminProductImage.urlKey) required String url,

    /// createdAt
    @JsonKey(name: AdminProductImage.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProductImage.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminProductImage.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: AdminProductImage.metadataKey)
    required Map<String, dynamic> metadata,

    /// rank
    @JsonKey(name: AdminProductImage.rankKey) required double rank,
  }) = _AdminProductImage;

  factory AdminProductImage.fromJson(Map<String, dynamic> json) =>
      _$AdminProductImageFromJson(json);

  static const String idKey = r'id';

  static const String urlKey = r'url';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';

  static const String rankKey = r'rank';
}
