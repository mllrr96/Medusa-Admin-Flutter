/// GetInvitesIdQueryParameters
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
part 'get_invites_id_query_parameters.freezed.dart';
part 'get_invites_id_query_parameters.g.dart'; // GetInvitesIdQueryParameters

@freezed
abstract class GetInvitesIdQueryParameters with _$GetInvitesIdQueryParameters {
  const GetInvitesIdQueryParameters._();

  @jsonSerializable
  const factory GetInvitesIdQueryParameters({
    /// fields
    @JsonKey(name: GetInvitesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetInvitesIdQueryParameters;

  factory GetInvitesIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetInvitesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
