/// PostInvitesQueryParameters
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
part 'post_invites_query_parameters.freezed.dart';
part 'post_invites_query_parameters.g.dart'; // PostInvitesQueryParameters

@freezed
abstract class PostInvitesQueryParameters with _$PostInvitesQueryParameters {
  const PostInvitesQueryParameters._();

  @jsonSerializable
  const factory PostInvitesQueryParameters({
    /// fields
    @JsonKey(name: PostInvitesQueryParameters.fieldsKey) required String fields,
  }) = _PostInvitesQueryParameters;

  factory PostInvitesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostInvitesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
