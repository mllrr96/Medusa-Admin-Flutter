/// PostProductTypesIdQueryParameters
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
part 'post_product_types_id_query_parameters.freezed.dart';
part 'post_product_types_id_query_parameters.g.dart'; // PostProductTypesIdQueryParameters

@freezed
abstract class PostProductTypesIdQueryParameters
    with _$PostProductTypesIdQueryParameters {
  const PostProductTypesIdQueryParameters._();

  @jsonSerializable
  const factory PostProductTypesIdQueryParameters({
    /// fields
    @JsonKey(name: PostProductTypesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductTypesIdQueryParameters;

  factory PostProductTypesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductTypesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
