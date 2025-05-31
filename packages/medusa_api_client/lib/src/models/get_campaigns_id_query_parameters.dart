/// GetCampaignsIdQueryParameters
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
part 'get_campaigns_id_query_parameters.freezed.dart';
part 'get_campaigns_id_query_parameters.g.dart'; // GetCampaignsIdQueryParameters

@freezed
abstract class GetCampaignsIdQueryParameters
    with _$GetCampaignsIdQueryParameters {
  const GetCampaignsIdQueryParameters._();

  @jsonSerializable
  const factory GetCampaignsIdQueryParameters({
    /// fields
    @JsonKey(name: GetCampaignsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetCampaignsIdQueryParameters;

  factory GetCampaignsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
