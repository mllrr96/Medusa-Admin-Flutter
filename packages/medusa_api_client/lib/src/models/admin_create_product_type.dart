/// AdminCreateProductType
/// {
///     "properties": {
///         "metadata": {
///             "type": "object",
///             "description": "The product's metadata, used to store custom key-value pairs."
///         },
///         "value": {
///             "type": "string",
///             "description": "The product type's value.",
///             "title": "value"
///         }
///     },
///     "type": "object",
///     "required": [
///         "value"
///     ],
///     "description": "The details of the product type to create."
/// }
library;

import 'exports.dart';
part 'admin_create_product_type.freezed.dart';
part 'admin_create_product_type.g.dart'; // AdminCreateProductType

@freezed
abstract class AdminCreateProductType with _$AdminCreateProductType {
  const AdminCreateProductType._();

  @jsonSerializable
  const factory AdminCreateProductType({
    /// metadata
    @JsonKey(name: AdminCreateProductType.metadataKey)
    required Map<String, dynamic> metadata,

    /// value
    @JsonKey(name: AdminCreateProductType.valueKey) required String value,
  }) = _AdminCreateProductType;

  factory AdminCreateProductType.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductTypeFromJson(json);

  static const String metadataKey = r'metadata';

  static const String valueKey = r'value';
}
