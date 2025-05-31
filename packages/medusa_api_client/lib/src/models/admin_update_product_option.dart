/// AdminUpdateProductOption
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The option's title.",
///             "title": "title"
///         },
///         "values": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "An option value.",
///                 "title": "values"
///             },
///             "description": "The option's values."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in a product option."
/// }
library admin_update_product_option;

import 'exports.dart';
part 'admin_update_product_option.freezed.dart';
part 'admin_update_product_option.g.dart'; // AdminUpdateProductOption

@freezed
abstract class AdminUpdateProductOption with _$AdminUpdateProductOption {
  const AdminUpdateProductOption._();

  @jsonSerializable
  const factory AdminUpdateProductOption({
    /// title
    @JsonKey(name: AdminUpdateProductOption.titleKey) required String title,

    /// values
    @JsonKey(name: AdminUpdateProductOption.valuesKey)
    required List<String> values,
  }) = _AdminUpdateProductOption;

  factory AdminUpdateProductOption.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateProductOptionFromJson(json);

  static const String titleKey = r'title';

  static const String valuesKey = r'values';
}
