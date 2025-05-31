/// PostCollectionsQueryParameters
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
part 'post_collections_query_parameters.freezed.dart';
part 'post_collections_query_parameters.g.dart'; // PostCollectionsQueryParameters

@freezed
abstract class PostCollectionsQueryParameters
    with _$PostCollectionsQueryParameters {
  const PostCollectionsQueryParameters._();

  @jsonSerializable
  const factory PostCollectionsQueryParameters({
    /// fields
    @JsonKey(name: PostCollectionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCollectionsQueryParameters;

  factory PostCollectionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostCollectionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
