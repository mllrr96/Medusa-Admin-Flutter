/// AdminServiceZoneDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The service zone's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "service_zone",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the service zone was deleted.",
///             "title": "deleted"
///         },
///         "parent": {
///             "$ref": "#/components/schemas/AdminFulfillmentSet"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the service zone deletion."
/// }
library;

import 'exports.dart';
part 'admin_service_zone_delete_response.freezed.dart';
part 'admin_service_zone_delete_response.g.dart'; // AdminServiceZoneDeleteResponse

@freezed
abstract class AdminServiceZoneDeleteResponse
    with _$AdminServiceZoneDeleteResponse {
  const AdminServiceZoneDeleteResponse._();

  @jsonSerializable
  const factory AdminServiceZoneDeleteResponse({
    /// id
    @JsonKey(name: AdminServiceZoneDeleteResponse.idKey) required String id,

    /// object
    @Default('service_zone')
    @JsonKey(name: AdminServiceZoneDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminServiceZoneDeleteResponse.deletedKey)
    required bool deleted,

    /// parent
    @JsonKey(name: AdminServiceZoneDeleteResponse.parentKey)
    required AdminFulfillmentSet parent,
  }) = _AdminServiceZoneDeleteResponse;

  factory AdminServiceZoneDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminServiceZoneDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';

  static const String parentKey = r'parent';
}
