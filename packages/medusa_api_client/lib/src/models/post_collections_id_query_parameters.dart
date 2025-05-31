/// PostCollectionsIdQueryParameters
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
part 'post_collections_id_query_parameters.freezed.dart';
part 'post_collections_id_query_parameters.g.dart'; // PostCollectionsIdQueryParameters

@freezed
abstract class PostCollectionsIdQueryParameters
    with _$PostCollectionsIdQueryParameters {
  const PostCollectionsIdQueryParameters._();

  @jsonSerializable
  const factory PostCollectionsIdQueryParameters({
    /// fields
    @JsonKey(name: PostCollectionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCollectionsIdQueryParameters;

  factory PostCollectionsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCollectionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
