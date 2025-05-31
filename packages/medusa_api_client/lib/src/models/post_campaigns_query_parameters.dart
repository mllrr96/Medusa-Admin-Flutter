/// PostCampaignsQueryParameters
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
part 'post_campaigns_query_parameters.freezed.dart';
part 'post_campaigns_query_parameters.g.dart'; // PostCampaignsQueryParameters

@freezed
abstract class PostCampaignsQueryParameters
    with _$PostCampaignsQueryParameters {
  const PostCampaignsQueryParameters._();

  @jsonSerializable
  const factory PostCampaignsQueryParameters({
    /// fields
    @JsonKey(name: PostCampaignsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCampaignsQueryParameters;

  factory PostCampaignsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostCampaignsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
