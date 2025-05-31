/// PostClaimsIdClaimItemsQueryParameters
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
part 'post_claims_id_claim_items_query_parameters.freezed.dart';
part 'post_claims_id_claim_items_query_parameters.g.dart'; // PostClaimsIdClaimItemsQueryParameters

@freezed
abstract class PostClaimsIdClaimItemsQueryParameters
    with _$PostClaimsIdClaimItemsQueryParameters {
  const PostClaimsIdClaimItemsQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdClaimItemsQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsIdClaimItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostClaimsIdClaimItemsQueryParameters;

  factory PostClaimsIdClaimItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdClaimItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
