/// AdminRegionResponse
/// {
///     "properties": {
///         "region": {
///             "$ref": "#/components/schemas/AdminRegion"
///         }
///     },
///     "type": "object",
///     "required": [
///         "region"
///     ],
///     "description": "The region's details."
/// }
library admin_region_response;

import 'exports.dart';
part 'admin_region_response.freezed.dart';
part 'admin_region_response.g.dart'; // AdminRegionResponse

@freezed
abstract class AdminRegionResponse with _$AdminRegionResponse {
  const AdminRegionResponse._();

  @jsonSerializable
  const factory AdminRegionResponse({
    /// region
    @JsonKey(name: AdminRegionResponse.regionKey) required AdminRegion region,
  }) = _AdminRegionResponse;

  factory AdminRegionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminRegionResponseFromJson(json);

  static const String regionKey = r'region';
}
