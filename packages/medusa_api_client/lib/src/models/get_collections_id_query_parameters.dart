/// GetCollectionsIdQueryParameters
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
part 'get_collections_id_query_parameters.freezed.dart';
part 'get_collections_id_query_parameters.g.dart'; // GetCollectionsIdQueryParameters

@freezed
abstract class GetCollectionsIdQueryParameters
    with _$GetCollectionsIdQueryParameters {
  const GetCollectionsIdQueryParameters._();

  @jsonSerializable
  const factory GetCollectionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetCollectionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetCollectionsIdQueryParameters;

  factory GetCollectionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
