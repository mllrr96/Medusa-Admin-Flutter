/// PostFulfillmentSetsIdServiceZonesQueryParameters
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
part 'post_fulfillment_sets_id_service_zones_query_parameters.freezed.dart';
part 'post_fulfillment_sets_id_service_zones_query_parameters.g.dart'; // PostFulfillmentSetsIdServiceZonesQueryParameters

@freezed
abstract class PostFulfillmentSetsIdServiceZonesQueryParameters
    with _$PostFulfillmentSetsIdServiceZonesQueryParameters {
  const PostFulfillmentSetsIdServiceZonesQueryParameters._();

  @jsonSerializable
  const factory PostFulfillmentSetsIdServiceZonesQueryParameters({
    /// fields
    @JsonKey(name: PostFulfillmentSetsIdServiceZonesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostFulfillmentSetsIdServiceZonesQueryParameters;

  factory PostFulfillmentSetsIdServiceZonesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostFulfillmentSetsIdServiceZonesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
