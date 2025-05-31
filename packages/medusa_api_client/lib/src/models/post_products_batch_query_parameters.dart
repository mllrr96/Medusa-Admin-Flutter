/// PostProductsBatchQueryParameters
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
part 'post_products_batch_query_parameters.freezed.dart';
part 'post_products_batch_query_parameters.g.dart'; // PostProductsBatchQueryParameters

@freezed
abstract class PostProductsBatchQueryParameters
    with _$PostProductsBatchQueryParameters {
  const PostProductsBatchQueryParameters._();

  @jsonSerializable
  const factory PostProductsBatchQueryParameters({
    /// fields
    @JsonKey(name: PostProductsBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsBatchQueryParameters;

  factory PostProductsBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
