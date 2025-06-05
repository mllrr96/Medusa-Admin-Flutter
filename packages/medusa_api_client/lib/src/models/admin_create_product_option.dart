/// AdminCreateProductOption
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The product option's title.",
///             "title": "title"
///         },
///         "values": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A value.",
///                 "title": "values"
///             },
///             "description": "The product option's values."
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "values"
///     ],
///     "description": "The product option's details."
/// }
library;

import 'exports.dart';
part 'admin_create_product_option.freezed.dart';
part 'admin_create_product_option.g.dart'; // AdminCreateProductOption

@freezed
abstract class AdminCreateProductOption with _$AdminCreateProductOption {
  const AdminCreateProductOption._();

  @jsonSerializable
  const factory AdminCreateProductOption({
    /// title
    @JsonKey(name: AdminCreateProductOption.titleKey) required String title,

    /// values
    @JsonKey(name: AdminCreateProductOption.valuesKey)
    required List<String> values,
  }) = _AdminCreateProductOption;

  factory AdminCreateProductOption.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductOptionFromJson(json);

  static const String titleKey = r'title';

  static const String valuesKey = r'values';
}
