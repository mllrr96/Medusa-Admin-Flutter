/// PostOrdersIdArchiveQueryParameters
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
part 'post_orders_id_archive_query_parameters.freezed.dart';
part 'post_orders_id_archive_query_parameters.g.dart'; // PostOrdersIdArchiveQueryParameters

@freezed
abstract class PostOrdersIdArchiveQueryParameters
    with _$PostOrdersIdArchiveQueryParameters {
  const PostOrdersIdArchiveQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdArchiveQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdArchiveQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdArchiveQueryParameters;

  factory PostOrdersIdArchiveQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdArchiveQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
