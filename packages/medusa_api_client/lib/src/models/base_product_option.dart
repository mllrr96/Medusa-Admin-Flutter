/// BaseProductOption
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product option's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The product option's title.",
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
///                 "$ref": "#/components/schemas/BaseProductOptionValue"
///             },
///             "description": "The product option's values."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product option's metadata, can hold custom key-value pairs."
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
///         "id",
///         "title"
///     ],
///     "description": "The product option's details."
/// }
library;

import 'exports.dart';
part 'base_product_option.freezed.dart';
part 'base_product_option.g.dart'; // BaseProductOption

@freezed
abstract class BaseProductOption with _$BaseProductOption {
  const BaseProductOption._();

  @jsonSerializable
  const factory BaseProductOption({
    /// id
    @JsonKey(name: BaseProductOption.idKey) required String id,

    /// title
    @JsonKey(name: BaseProductOption.titleKey) required String title,

    /// product
    @JsonKey(name: BaseProductOption.productKey)
    required Map<String, dynamic> product,

    /// productId
    @JsonKey(name: BaseProductOption.productIdKey) required String productId,

    /// values
    @JsonKey(name: BaseProductOption.valuesKey)
    required List<BaseProductOptionValue> values,

    /// metadata
    @JsonKey(name: BaseProductOption.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseProductOption.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductOption.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductOption.deletedAtKey) required DateTime deletedAt,
  }) = _BaseProductOption;

  factory BaseProductOption.fromJson(Map<String, dynamic> json) =>
      _$BaseProductOptionFromJson(json);

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
