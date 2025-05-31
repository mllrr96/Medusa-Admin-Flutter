/// PostClaimsIdClaimItemsActionIdQueryParameters
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
part 'post_claims_id_claim_items_action_id_query_parameters.freezed.dart';
part 'post_claims_id_claim_items_action_id_query_parameters.g.dart'; // PostClaimsIdClaimItemsActionIdQueryParameters

@freezed
abstract class PostClaimsIdClaimItemsActionIdQueryParameters
    with _$PostClaimsIdClaimItemsActionIdQueryParameters {
  const PostClaimsIdClaimItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdClaimItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsIdClaimItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostClaimsIdClaimItemsActionIdQueryParameters;

  factory PostClaimsIdClaimItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdClaimItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
