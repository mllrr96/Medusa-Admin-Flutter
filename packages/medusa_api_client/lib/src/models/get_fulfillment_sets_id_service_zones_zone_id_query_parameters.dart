/// GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_fulfillment_sets_id_service_zones_zone_id_query_parameters.freezed.dart';
part 'get_fulfillment_sets_id_service_zones_zone_id_query_parameters.g.dart'; // GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters

@freezed
abstract class GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters
    with _$GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters {
  const GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters._();

  @jsonSerializable
  const factory GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters({
    /// fields
    @JsonKey(
      name: GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters;

  factory GetFulfillmentSetsIdServiceZonesZoneIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetFulfillmentSetsIdServiceZonesZoneIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
