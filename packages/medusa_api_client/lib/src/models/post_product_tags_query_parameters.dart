/// PostProductTagsQueryParameters
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
part 'post_product_tags_query_parameters.freezed.dart';
part 'post_product_tags_query_parameters.g.dart'; // PostProductTagsQueryParameters

@freezed
abstract class PostProductTagsQueryParameters
    with _$PostProductTagsQueryParameters {
  const PostProductTagsQueryParameters._();

  @jsonSerializable
  const factory PostProductTagsQueryParameters({
    /// fields
    @JsonKey(name: PostProductTagsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductTagsQueryParameters;

  factory PostProductTagsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostProductTagsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
