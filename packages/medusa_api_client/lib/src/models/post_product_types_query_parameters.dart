/// PostProductTypesQueryParameters
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
part 'post_product_types_query_parameters.freezed.dart';
part 'post_product_types_query_parameters.g.dart'; // PostProductTypesQueryParameters

@freezed
abstract class PostProductTypesQueryParameters
    with _$PostProductTypesQueryParameters {
  const PostProductTypesQueryParameters._();

  @jsonSerializable
  const factory PostProductTypesQueryParameters({
    /// fields
    @JsonKey(name: PostProductTypesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductTypesQueryParameters;

  factory PostProductTypesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostProductTypesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
