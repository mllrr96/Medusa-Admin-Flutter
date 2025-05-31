/// PostClaimsIdInboundShippingMethodActionIdQueryParameters
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
part 'post_claims_id_inbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'post_claims_id_inbound_shipping_method_action_id_query_parameters.g.dart'; // PostClaimsIdInboundShippingMethodActionIdQueryParameters

@freezed
abstract class PostClaimsIdInboundShippingMethodActionIdQueryParameters
    with _$PostClaimsIdInboundShippingMethodActionIdQueryParameters {
  const PostClaimsIdInboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdInboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: PostClaimsIdInboundShippingMethodActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostClaimsIdInboundShippingMethodActionIdQueryParameters;

  factory PostClaimsIdInboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdInboundShippingMethodActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
