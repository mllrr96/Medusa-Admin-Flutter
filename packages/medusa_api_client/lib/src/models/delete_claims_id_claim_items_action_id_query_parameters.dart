/// DeleteClaimsIdClaimItemsActionIdQueryParameters
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
part 'delete_claims_id_claim_items_action_id_query_parameters.freezed.dart';
part 'delete_claims_id_claim_items_action_id_query_parameters.g.dart'; // DeleteClaimsIdClaimItemsActionIdQueryParameters

@freezed
abstract class DeleteClaimsIdClaimItemsActionIdQueryParameters
    with _$DeleteClaimsIdClaimItemsActionIdQueryParameters {
  const DeleteClaimsIdClaimItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteClaimsIdClaimItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteClaimsIdClaimItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteClaimsIdClaimItemsActionIdQueryParameters;

  factory DeleteClaimsIdClaimItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteClaimsIdClaimItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
