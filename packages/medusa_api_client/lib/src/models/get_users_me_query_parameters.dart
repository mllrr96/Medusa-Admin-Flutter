/// GetUsersMeQueryParameters
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
part 'get_users_me_query_parameters.freezed.dart';
part 'get_users_me_query_parameters.g.dart'; // GetUsersMeQueryParameters

@freezed
abstract class GetUsersMeQueryParameters with _$GetUsersMeQueryParameters {
  const GetUsersMeQueryParameters._();

  @jsonSerializable
  const factory GetUsersMeQueryParameters({
    /// fields
    @JsonKey(name: GetUsersMeQueryParameters.fieldsKey) required String fields,
  }) = _GetUsersMeQueryParameters;

  factory GetUsersMeQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetUsersMeQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
