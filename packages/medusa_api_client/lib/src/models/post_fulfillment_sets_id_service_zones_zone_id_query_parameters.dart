/// PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters
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
part 'post_fulfillment_sets_id_service_zones_zone_id_query_parameters.freezed.dart';
part 'post_fulfillment_sets_id_service_zones_zone_id_query_parameters.g.dart'; // PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters

@freezed
abstract class PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters
    with _$PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters {
  const PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters._();

  @jsonSerializable
  const factory PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters({
    /// fields
    @JsonKey(
      name: PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters;

  factory PostFulfillmentSetsIdServiceZonesZoneIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostFulfillmentSetsIdServiceZonesZoneIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
