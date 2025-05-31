/// StoreProductType
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product type's ID.",
///             "title": "id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product type's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product type was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product type was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product type was deleted.",
///             "title": "deleted_at"
///         },
///         "value": {
///             "type": "string",
///             "description": "The type's value.",
///             "title": "value"
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
library store_product_type;

import 'exports.dart';
part 'store_product_type.freezed.dart';
part 'store_product_type.g.dart'; // StoreProductType

@freezed
abstract class StoreProductType with _$StoreProductType {
  const StoreProductType._();

  @jsonSerializable
  const factory StoreProductType({
    /// id
    @JsonKey(name: StoreProductType.idKey) required String id,

    /// metadata
    @JsonKey(name: StoreProductType.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreProductType.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductType.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductType.deletedAtKey) required DateTime deletedAt,

    /// value
    @JsonKey(name: StoreProductType.valueKey) required String value,
  }) = _StoreProductType;

  factory StoreProductType.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTypeFromJson(json);

  static const String idKey = r'id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String valueKey = r'value';
}
