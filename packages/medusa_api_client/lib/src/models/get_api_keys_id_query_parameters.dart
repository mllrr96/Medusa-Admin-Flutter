/// GetApiKeysIdQueryParameters
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
part 'get_api_keys_id_query_parameters.freezed.dart';
part 'get_api_keys_id_query_parameters.g.dart'; // GetApiKeysIdQueryParameters

@freezed
abstract class GetApiKeysIdQueryParameters with _$GetApiKeysIdQueryParameters {
  const GetApiKeysIdQueryParameters._();

  @jsonSerializable
  const factory GetApiKeysIdQueryParameters({
    /// fields
    @JsonKey(name: GetApiKeysIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetApiKeysIdQueryParameters;

  factory GetApiKeysIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetApiKeysIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
