/// PostFulfillmentsIdShipmentQueryParameters
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
part 'post_fulfillments_id_shipment_query_parameters.freezed.dart';
part 'post_fulfillments_id_shipment_query_parameters.g.dart'; // PostFulfillmentsIdShipmentQueryParameters

@freezed
abstract class PostFulfillmentsIdShipmentQueryParameters
    with _$PostFulfillmentsIdShipmentQueryParameters {
  const PostFulfillmentsIdShipmentQueryParameters._();

  @jsonSerializable
  const factory PostFulfillmentsIdShipmentQueryParameters({
    /// fields
    @JsonKey(name: PostFulfillmentsIdShipmentQueryParameters.fieldsKey)
    required String fields,
  }) = _PostFulfillmentsIdShipmentQueryParameters;

  factory PostFulfillmentsIdShipmentQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostFulfillmentsIdShipmentQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
