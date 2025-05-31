/// DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters
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
part 'delete_claims_id_outbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'delete_claims_id_outbound_shipping_method_action_id_query_parameters.g.dart'; // DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters

@freezed
abstract class DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters
    with _$DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters {
  const DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name:
          DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters;

  factory DeleteClaimsIdOutboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteClaimsIdOutboundShippingMethodActionIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
