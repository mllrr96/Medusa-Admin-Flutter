/// AdminShippingOptionType
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping option's ID.",
///             "title": "id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option was deleted.",
///             "title": "deleted_at"
///         },
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
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The type's shipping option id.",
///             "title": "shipping_option_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "label",
///         "description",
///         "code",
///         "shipping_option_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The shipping option's details."
/// }
library admin_shipping_option_type;

import 'exports.dart';
part 'admin_shipping_option_type.freezed.dart';
part 'admin_shipping_option_type.g.dart'; // AdminShippingOptionType

@freezed
abstract class AdminShippingOptionType with _$AdminShippingOptionType {
  const AdminShippingOptionType._();

  @jsonSerializable
  const factory AdminShippingOptionType({
    /// id
    @JsonKey(name: AdminShippingOptionType.idKey) required String id,

    /// createdAt
    @JsonKey(name: AdminShippingOptionType.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingOptionType.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingOptionType.deletedAtKey)
    required DateTime deletedAt,

    /// label
    @JsonKey(name: AdminShippingOptionType.labelKey) required String label,

    /// description
    @JsonKey(name: AdminShippingOptionType.descriptionKey)
    required String description,

    /// code
    @JsonKey(name: AdminShippingOptionType.codeKey) required String code,

    /// shippingOptionId
    @JsonKey(name: AdminShippingOptionType.shippingOptionIdKey)
    required String shippingOptionId,
  }) = _AdminShippingOptionType;

  factory AdminShippingOptionType.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionTypeFromJson(json);

  static const String idKey = r'id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String codeKey = r'code';

  static const String shippingOptionIdKey = r'shipping_option_id';
}
