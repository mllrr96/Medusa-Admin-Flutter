/// StoreShippingOptionType
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The type's ID.",
///             "title": "id"
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
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the type was deleted.",
///             "title": "deleted_at"
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
///     "description": "The shipping option type's details."
/// }
library store_shipping_option_type;

import 'exports.dart';
part 'store_shipping_option_type.freezed.dart';
part 'store_shipping_option_type.g.dart'; // StoreShippingOptionType

@freezed
abstract class StoreShippingOptionType with _$StoreShippingOptionType {
  const StoreShippingOptionType._();

  @jsonSerializable
  const factory StoreShippingOptionType({
    /// id
    @JsonKey(name: StoreShippingOptionType.idKey) required String id,

    /// label
    @JsonKey(name: StoreShippingOptionType.labelKey) required String label,

    /// description
    @JsonKey(name: StoreShippingOptionType.descriptionKey)
    required String description,

    /// code
    @JsonKey(name: StoreShippingOptionType.codeKey) required String code,

    /// shippingOptionId
    @JsonKey(name: StoreShippingOptionType.shippingOptionIdKey)
    required String shippingOptionId,

    /// createdAt
    @JsonKey(name: StoreShippingOptionType.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreShippingOptionType.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreShippingOptionType.deletedAtKey)
    required DateTime deletedAt,
  }) = _StoreShippingOptionType;

  factory StoreShippingOptionType.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingOptionTypeFromJson(json);

  static const String idKey = r'id';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String codeKey = r'code';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
