/// AdminShippingProfileDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping profile's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "shipping_profile",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the shipping profile was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the shipping profile's deletion."
/// }
library;

import 'exports.dart';
part 'admin_shipping_profile_delete_response.freezed.dart';
part 'admin_shipping_profile_delete_response.g.dart'; // AdminShippingProfileDeleteResponse

@freezed
abstract class AdminShippingProfileDeleteResponse
    with _$AdminShippingProfileDeleteResponse {
  const AdminShippingProfileDeleteResponse._();

  @jsonSerializable
  const factory AdminShippingProfileDeleteResponse({
    /// id
    @JsonKey(name: AdminShippingProfileDeleteResponse.idKey) required String id,

    /// object
    @Default('shipping_profile')
    @JsonKey(name: AdminShippingProfileDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminShippingProfileDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminShippingProfileDeleteResponse;

  factory AdminShippingProfileDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminShippingProfileDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
