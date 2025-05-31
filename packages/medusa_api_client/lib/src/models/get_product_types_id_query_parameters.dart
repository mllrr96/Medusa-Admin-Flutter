/// GetProductTypesIdQueryParameters
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
part 'get_product_types_id_query_parameters.freezed.dart';
part 'get_product_types_id_query_parameters.g.dart'; // GetProductTypesIdQueryParameters

@freezed
abstract class GetProductTypesIdQueryParameters
    with _$GetProductTypesIdQueryParameters {
  const GetProductTypesIdQueryParameters._();

  @jsonSerializable
  const factory GetProductTypesIdQueryParameters({
    /// fields
    @JsonKey(name: GetProductTypesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetProductTypesIdQueryParameters;

  factory GetProductTypesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductTypesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
