/// PostProductTagsIdQueryParameters
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
part 'post_product_tags_id_query_parameters.freezed.dart';
part 'post_product_tags_id_query_parameters.g.dart'; // PostProductTagsIdQueryParameters

@freezed
abstract class PostProductTagsIdQueryParameters
    with _$PostProductTagsIdQueryParameters {
  const PostProductTagsIdQueryParameters._();

  @jsonSerializable
  const factory PostProductTagsIdQueryParameters({
    /// fields
    @JsonKey(name: PostProductTagsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductTagsIdQueryParameters;

  factory PostProductTagsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductTagsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
