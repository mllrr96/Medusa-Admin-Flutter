/// StoreCollection
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
///             "description": "The date the collection was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the collection was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the collection was deleted.",
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
///             "description": "The collection's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "id",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "handle",
///         "deleted_at"
///     ],
///     "description": "The collection's details."
/// }
library;

import 'exports.dart';
part 'store_collection.freezed.dart';
part 'store_collection.g.dart'; // StoreCollection

@freezed
abstract class StoreCollection with _$StoreCollection {
  const StoreCollection._();

  @jsonSerializable
  const factory StoreCollection({
    /// id
    @JsonKey(name: StoreCollection.idKey) required String id,

    /// title
    @JsonKey(name: StoreCollection.titleKey) required String title,

    /// handle
    @JsonKey(name: StoreCollection.handleKey) required String handle,

    /// createdAt
    @JsonKey(name: StoreCollection.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCollection.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreCollection.deletedAtKey) required DateTime deletedAt,

    /// products
    @JsonKey(name: StoreCollection.productsKey)
    required List<Map<String, dynamic>> products,

    /// metadata
    @JsonKey(name: StoreCollection.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreCollection;

  factory StoreCollection.fromJson(Map<String, dynamic> json) =>
      _$StoreCollectionFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String handleKey = r'handle';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String productsKey = r'products';

  static const String metadataKey = r'metadata';
}
