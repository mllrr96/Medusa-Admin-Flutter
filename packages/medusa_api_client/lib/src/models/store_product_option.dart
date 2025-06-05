/// StoreProductOption
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The option's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The option's title.",
///             "title": "title"
///         },
///         "product": {
///             "type": "object"
///         },
///         "product_id": {
///             "type": "string",
///             "description": "The ID of the product this option belongs to.",
///             "title": "product_id"
///         },
///         "values": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductOptionValue"
///             },
///             "description": "The option's values."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The option's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product option was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product option was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product option was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "id"
///     ],
///     "description": "The product option's details."
/// }
library;

import 'exports.dart';
part 'store_product_option.freezed.dart';
part 'store_product_option.g.dart'; // StoreProductOption

@freezed
abstract class StoreProductOption with _$StoreProductOption {
  const StoreProductOption._();

  @jsonSerializable
  const factory StoreProductOption({
    /// id
    @JsonKey(name: StoreProductOption.idKey) required String id,

    /// title
    @JsonKey(name: StoreProductOption.titleKey) required String title,

    /// product
    @JsonKey(name: StoreProductOption.productKey)
    required Map<String, dynamic> product,

    /// productId
    @JsonKey(name: StoreProductOption.productIdKey) required String productId,

    /// values
    @JsonKey(name: StoreProductOption.valuesKey)
    required List<StoreProductOptionValue> values,

    /// metadata
    @JsonKey(name: StoreProductOption.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreProductOption.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductOption.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductOption.deletedAtKey) required DateTime deletedAt,
  }) = _StoreProductOption;

  factory StoreProductOption.fromJson(Map<String, dynamic> json) =>
      _$StoreProductOptionFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String productKey = r'product';

  static const String productIdKey = r'product_id';

  static const String valuesKey = r'values';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
