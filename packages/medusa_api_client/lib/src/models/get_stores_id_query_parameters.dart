/// GetStoresIdQueryParameters
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
part 'get_stores_id_query_parameters.freezed.dart';
part 'get_stores_id_query_parameters.g.dart'; // GetStoresIdQueryParameters

@freezed
abstract class GetStoresIdQueryParameters with _$GetStoresIdQueryParameters {
  const GetStoresIdQueryParameters._();

  @jsonSerializable
  const factory GetStoresIdQueryParameters({
    /// fields
    @JsonKey(name: GetStoresIdQueryParameters.fieldsKey) required String fields,
  }) = _GetStoresIdQueryParameters;

  factory GetStoresIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetStoresIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
