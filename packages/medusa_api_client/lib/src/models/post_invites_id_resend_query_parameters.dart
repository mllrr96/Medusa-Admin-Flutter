/// PostInvitesIdResendQueryParameters
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
part 'post_invites_id_resend_query_parameters.freezed.dart';
part 'post_invites_id_resend_query_parameters.g.dart'; // PostInvitesIdResendQueryParameters

@freezed
abstract class PostInvitesIdResendQueryParameters
    with _$PostInvitesIdResendQueryParameters {
  const PostInvitesIdResendQueryParameters._();

  @jsonSerializable
  const factory PostInvitesIdResendQueryParameters({
    /// fields
    @JsonKey(name: PostInvitesIdResendQueryParameters.fieldsKey)
    required String fields,
  }) = _PostInvitesIdResendQueryParameters;

  factory PostInvitesIdResendQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostInvitesIdResendQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
