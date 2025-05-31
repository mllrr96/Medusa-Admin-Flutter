/// AdminCreateShippingOptionType
/// {
///     "properties": {
///         "label": {
///             "type": "string",
///             "description": "The type's label.",
///             "title": "label"
///         },
///         "description": {
///             "type": "string",
///             "description": "The type's description.",
///             "title": "description"
///         },
///         "code": {
///             "type": "string",
///             "description": "The type's code.",
///             "title": "code"
///         }
///     },
///     "type": "object",
///     "required": [
///         "label",
///         "description",
///         "code"
///     ],
///     "description": "The shipping option type's details."
/// }
library;

import 'exports.dart';
part 'admin_create_shipping_option_type.freezed.dart';
part 'admin_create_shipping_option_type.g.dart'; // AdminCreateShippingOptionType

@freezed
abstract class AdminCreateShippingOptionType
    with _$AdminCreateShippingOptionType {
  const AdminCreateShippingOptionType._();

  @jsonSerializable
  const factory AdminCreateShippingOptionType({
    /// label
    @JsonKey(name: AdminCreateShippingOptionType.labelKey)
    required String label,

    /// description
    @JsonKey(name: AdminCreateShippingOptionType.descriptionKey)
    required String description,

    /// code
    @JsonKey(name: AdminCreateShippingOptionType.codeKey) required String code,
  }) = _AdminCreateShippingOptionType;

  factory AdminCreateShippingOptionType.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateShippingOptionTypeFromJson(json);

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String codeKey = r'code';
}
