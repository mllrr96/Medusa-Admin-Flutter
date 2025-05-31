/// GetClaimsIdQueryParameters
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
part 'get_claims_id_query_parameters.freezed.dart';
part 'get_claims_id_query_parameters.g.dart'; // GetClaimsIdQueryParameters

@freezed
abstract class GetClaimsIdQueryParameters with _$GetClaimsIdQueryParameters {
  const GetClaimsIdQueryParameters._();

  @jsonSerializable
  const factory GetClaimsIdQueryParameters({
    /// fields
    @JsonKey(name: GetClaimsIdQueryParameters.fieldsKey) required String fields,
  }) = _GetClaimsIdQueryParameters;

  factory GetClaimsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetClaimsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
