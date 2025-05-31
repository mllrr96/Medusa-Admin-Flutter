/// PostClaimsIdOutboundShippingMethodQueryParameters
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
part 'post_claims_id_outbound_shipping_method_query_parameters.freezed.dart';
part 'post_claims_id_outbound_shipping_method_query_parameters.g.dart'; // PostClaimsIdOutboundShippingMethodQueryParameters

@freezed
abstract class PostClaimsIdOutboundShippingMethodQueryParameters
    with _$PostClaimsIdOutboundShippingMethodQueryParameters {
  const PostClaimsIdOutboundShippingMethodQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdOutboundShippingMethodQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsIdOutboundShippingMethodQueryParameters.fieldsKey)
    required String fields,
  }) = _PostClaimsIdOutboundShippingMethodQueryParameters;

  factory PostClaimsIdOutboundShippingMethodQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdOutboundShippingMethodQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
