/// PostUsersIdQueryParameters
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
part 'post_users_id_query_parameters.freezed.dart';
part 'post_users_id_query_parameters.g.dart'; // PostUsersIdQueryParameters

@freezed
abstract class PostUsersIdQueryParameters with _$PostUsersIdQueryParameters {
  const PostUsersIdQueryParameters._();

  @jsonSerializable
  const factory PostUsersIdQueryParameters({
    /// fields
    @JsonKey(name: PostUsersIdQueryParameters.fieldsKey) required String fields,
  }) = _PostUsersIdQueryParameters;

  factory PostUsersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostUsersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
