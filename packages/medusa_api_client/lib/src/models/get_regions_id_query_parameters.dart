/// GetRegionsIdQueryParameters
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
part 'get_regions_id_query_parameters.freezed.dart';
part 'get_regions_id_query_parameters.g.dart'; // GetRegionsIdQueryParameters

@freezed
abstract class GetRegionsIdQueryParameters with _$GetRegionsIdQueryParameters {
  const GetRegionsIdQueryParameters._();

  @jsonSerializable
  const factory GetRegionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetRegionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetRegionsIdQueryParameters;

  factory GetRegionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetRegionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
