/// AdminCollection
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
///                 "$ref": "#/components/schemas/BaseProduct"
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
library admin_collection;

import 'exports.dart';
part 'admin_collection.freezed.dart';
part 'admin_collection.g.dart'; // AdminCollection

@freezed
abstract class AdminCollection with _$AdminCollection {
  const AdminCollection._();

  @jsonSerializable
  const factory AdminCollection({
    /// id
    @JsonKey(name: AdminCollection.idKey) required String id,

    /// title
    @JsonKey(name: AdminCollection.titleKey) required String title,

    /// handle
    @JsonKey(name: AdminCollection.handleKey) required String handle,

    /// createdAt
    @JsonKey(name: AdminCollection.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCollection.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminCollection.deletedAtKey) required DateTime deletedAt,

    /// products
    @JsonKey(name: AdminCollection.productsKey)
    required List<BaseProduct> products,

    /// metadata
    @JsonKey(name: AdminCollection.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCollection;

  factory AdminCollection.fromJson(Map<String, dynamic> json) =>
      _$AdminCollectionFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String handleKey = r'handle';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String productsKey = r'products';

  static const String metadataKey = r'metadata';
}
