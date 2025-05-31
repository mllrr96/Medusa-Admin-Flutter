/// PostClaimsIdOutboundShippingMethodActionIdQueryParameters
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
part 'post_claims_id_outbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'post_claims_id_outbound_shipping_method_action_id_query_parameters.g.dart'; // PostClaimsIdOutboundShippingMethodActionIdQueryParameters

@freezed
abstract class PostClaimsIdOutboundShippingMethodActionIdQueryParameters
    with _$PostClaimsIdOutboundShippingMethodActionIdQueryParameters {
  const PostClaimsIdOutboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdOutboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: PostClaimsIdOutboundShippingMethodActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostClaimsIdOutboundShippingMethodActionIdQueryParameters;

  factory PostClaimsIdOutboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PostClaimsIdOutboundShippingMethodActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
