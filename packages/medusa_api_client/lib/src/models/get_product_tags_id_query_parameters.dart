/// GetProductTagsIdQueryParameters
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
part 'get_product_tags_id_query_parameters.freezed.dart';
part 'get_product_tags_id_query_parameters.g.dart'; // GetProductTagsIdQueryParameters

@freezed
abstract class GetProductTagsIdQueryParameters
    with _$GetProductTagsIdQueryParameters {
  const GetProductTagsIdQueryParameters._();

  @jsonSerializable
  const factory GetProductTagsIdQueryParameters({
    /// fields
    @JsonKey(name: GetProductTagsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetProductTagsIdQueryParameters;

  factory GetProductTagsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProductTagsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
