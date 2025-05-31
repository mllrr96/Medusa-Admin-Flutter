/// PostCampaignsIdQueryParameters
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
part 'post_campaigns_id_query_parameters.freezed.dart';
part 'post_campaigns_id_query_parameters.g.dart'; // PostCampaignsIdQueryParameters

@freezed
abstract class PostCampaignsIdQueryParameters
    with _$PostCampaignsIdQueryParameters {
  const PostCampaignsIdQueryParameters._();

  @jsonSerializable
  const factory PostCampaignsIdQueryParameters({
    /// fields
    @JsonKey(name: PostCampaignsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCampaignsIdQueryParameters;

  factory PostCampaignsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostCampaignsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
