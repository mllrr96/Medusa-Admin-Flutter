/// StoreProductImage
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
///             "description": "The image's rank among its sibling images",
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
library store_product_image;

import 'exports.dart';
part 'store_product_image.freezed.dart';
part 'store_product_image.g.dart'; // StoreProductImage

@freezed
abstract class StoreProductImage with _$StoreProductImage {
  const StoreProductImage._();

  @jsonSerializable
  const factory StoreProductImage({
    /// id
    @JsonKey(name: StoreProductImage.idKey) required String id,

    /// url
    @JsonKey(name: StoreProductImage.urlKey) required String url,

    /// createdAt
    @JsonKey(name: StoreProductImage.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductImage.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductImage.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: StoreProductImage.metadataKey)
    required Map<String, dynamic> metadata,

    /// rank
    @JsonKey(name: StoreProductImage.rankKey) required double rank,
  }) = _StoreProductImage;

  factory StoreProductImage.fromJson(Map<String, dynamic> json) =>
      _$StoreProductImageFromJson(json);

  static const String idKey = r'id';

  static const String urlKey = r'url';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';

  static const String rankKey = r'rank';
}
