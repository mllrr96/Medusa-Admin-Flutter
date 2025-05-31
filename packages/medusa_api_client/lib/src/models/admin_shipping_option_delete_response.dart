/// AdminShippingOptionDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping option's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "shipping_option",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the shipping option was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the shipping option's deletion."
/// }
library;

import 'exports.dart';
part 'admin_shipping_option_delete_response.freezed.dart';
part 'admin_shipping_option_delete_response.g.dart'; // AdminShippingOptionDeleteResponse

@freezed
abstract class AdminShippingOptionDeleteResponse
    with _$AdminShippingOptionDeleteResponse {
  const AdminShippingOptionDeleteResponse._();

  @jsonSerializable
  const factory AdminShippingOptionDeleteResponse({
    /// id
    @JsonKey(name: AdminShippingOptionDeleteResponse.idKey) required String id,

    /// object
    @Default('shipping_option')
    @JsonKey(name: AdminShippingOptionDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminShippingOptionDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminShippingOptionDeleteResponse;

  factory AdminShippingOptionDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminShippingOptionDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
