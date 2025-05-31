/// GetUsersIdQueryParameters
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
part 'get_users_id_query_parameters.freezed.dart';
part 'get_users_id_query_parameters.g.dart'; // GetUsersIdQueryParameters

@freezed
abstract class GetUsersIdQueryParameters with _$GetUsersIdQueryParameters {
  const GetUsersIdQueryParameters._();

  @jsonSerializable
  const factory GetUsersIdQueryParameters({
    /// fields
    @JsonKey(name: GetUsersIdQueryParameters.fieldsKey) required String fields,
  }) = _GetUsersIdQueryParameters;

  factory GetUsersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetUsersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
