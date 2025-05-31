/// PostCollectionsIdProductsQueryParameters
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
part 'post_collections_id_products_query_parameters.freezed.dart';
part 'post_collections_id_products_query_parameters.g.dart'; // PostCollectionsIdProductsQueryParameters

@freezed
abstract class PostCollectionsIdProductsQueryParameters
    with _$PostCollectionsIdProductsQueryParameters {
  const PostCollectionsIdProductsQueryParameters._();

  @jsonSerializable
  const factory PostCollectionsIdProductsQueryParameters({
    /// fields
    @JsonKey(name: PostCollectionsIdProductsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCollectionsIdProductsQueryParameters;

  factory PostCollectionsIdProductsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCollectionsIdProductsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
