/// BaseCollection
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The collection's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The collection's title.",
///             "title": "title"
///         },
///         "handle": {
///             "type": "string",
///             "description": "The collection's handle.",
///             "title": "handle"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The collection's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The collection's update date.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The collection's deletion date.",
///             "title": "deleted_at"
///         },
///         "products": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The collection's products."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The collection's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "handle",
///         "created_at",
///         "updated_at",
///         "deleted_at",
///         "metadata"
///     ],
///     "description": "The product collection's details."
/// }
library base_collection;

import 'exports.dart';
part 'base_collection.freezed.dart';
part 'base_collection.g.dart'; // BaseCollection

@freezed
abstract class BaseCollection with _$BaseCollection {
  const BaseCollection._();

  @jsonSerializable
  const factory BaseCollection({
    /// id
    @JsonKey(name: BaseCollection.idKey) required String id,

    /// title
    @JsonKey(name: BaseCollection.titleKey) required String title,

    /// handle
    @JsonKey(name: BaseCollection.handleKey) required String handle,

    /// createdAt
    @JsonKey(name: BaseCollection.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseCollection.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseCollection.deletedAtKey) required DateTime deletedAt,

    /// products
    @JsonKey(name: BaseCollection.productsKey)
    required List<Map<String, dynamic>> products,

    /// metadata
    @JsonKey(name: BaseCollection.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _BaseCollection;

  factory BaseCollection.fromJson(Map<String, dynamic> json) =>
      _$BaseCollectionFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String handleKey = r'handle';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String productsKey = r'products';

  static const String metadataKey = r'metadata';
}
