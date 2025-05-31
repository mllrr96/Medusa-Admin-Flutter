/// PostStoresIdQueryParameters
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
part 'post_stores_id_query_parameters.freezed.dart';
part 'post_stores_id_query_parameters.g.dart'; // PostStoresIdQueryParameters

@freezed
abstract class PostStoresIdQueryParameters with _$PostStoresIdQueryParameters {
  const PostStoresIdQueryParameters._();

  @jsonSerializable
  const factory PostStoresIdQueryParameters({
    /// fields
    @JsonKey(name: PostStoresIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostStoresIdQueryParameters;

  factory PostStoresIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostStoresIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
