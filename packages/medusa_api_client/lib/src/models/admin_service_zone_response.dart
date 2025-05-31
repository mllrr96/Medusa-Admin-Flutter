/// AdminServiceZoneResponse
/// {
///     "properties": {
///         "service_zone": {
///             "$ref": "#/components/schemas/AdminServiceZone"
///         }
///     },
///     "type": "object",
///     "required": [
///         "service_zone"
///     ],
///     "description": "The service zone's details."
/// }
library admin_service_zone_response;

import 'exports.dart';
part 'admin_service_zone_response.freezed.dart';
part 'admin_service_zone_response.g.dart'; // AdminServiceZoneResponse

@freezed
abstract class AdminServiceZoneResponse with _$AdminServiceZoneResponse {
  const AdminServiceZoneResponse._();

  @jsonSerializable
  const factory AdminServiceZoneResponse({
    /// serviceZone
    @JsonKey(name: AdminServiceZoneResponse.serviceZoneKey)
    required AdminServiceZone serviceZone,
  }) = _AdminServiceZoneResponse;

  factory AdminServiceZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminServiceZoneResponseFromJson(json);

  static const String serviceZoneKey = r'service_zone';
}
