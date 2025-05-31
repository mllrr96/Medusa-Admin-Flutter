/// PostClaimsIdOutboundItemsActionIdQueryParameters
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
part 'post_claims_id_outbound_items_action_id_query_parameters.freezed.dart';
part 'post_claims_id_outbound_items_action_id_query_parameters.g.dart'; // PostClaimsIdOutboundItemsActionIdQueryParameters

@freezed
abstract class PostClaimsIdOutboundItemsActionIdQueryParameters
    with _$PostClaimsIdOutboundItemsActionIdQueryParameters {
  const PostClaimsIdOutboundItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdOutboundItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsIdOutboundItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostClaimsIdOutboundItemsActionIdQueryParameters;

  factory PostClaimsIdOutboundItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdOutboundItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
