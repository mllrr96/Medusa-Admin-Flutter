/// DeleteClaimsIdOutboundItemsActionIdQueryParameters
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
part 'delete_claims_id_outbound_items_action_id_query_parameters.freezed.dart';
part 'delete_claims_id_outbound_items_action_id_query_parameters.g.dart'; // DeleteClaimsIdOutboundItemsActionIdQueryParameters

@freezed
abstract class DeleteClaimsIdOutboundItemsActionIdQueryParameters
    with _$DeleteClaimsIdOutboundItemsActionIdQueryParameters {
  const DeleteClaimsIdOutboundItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteClaimsIdOutboundItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteClaimsIdOutboundItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteClaimsIdOutboundItemsActionIdQueryParameters;

  factory DeleteClaimsIdOutboundItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteClaimsIdOutboundItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
