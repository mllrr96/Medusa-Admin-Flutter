/// AdminCreateProductTag
/// {
///     "properties": {
///         "value": {
///             "type": "string",
///             "description": "The product tag's value.",
///             "title": "value"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product tag's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "value"
///     ],
///     "description": "The product tag's details."
/// }
library;

import 'exports.dart';
part 'admin_create_product_tag.freezed.dart';
part 'admin_create_product_tag.g.dart'; // AdminCreateProductTag

@freezed
abstract class AdminCreateProductTag with _$AdminCreateProductTag {
  const AdminCreateProductTag._();

  @jsonSerializable
  const factory AdminCreateProductTag({
    /// value
    @JsonKey(name: AdminCreateProductTag.valueKey) required String value,

    /// metadata
    @JsonKey(name: AdminCreateProductTag.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateProductTag;

  factory AdminCreateProductTag.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductTagFromJson(json);

  static const String valueKey = r'value';

  static const String metadataKey = r'metadata';
}
