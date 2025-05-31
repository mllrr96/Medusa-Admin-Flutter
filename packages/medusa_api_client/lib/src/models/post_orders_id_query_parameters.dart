/// PostOrdersIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_orders_id_query_parameters.freezed.dart';
part 'post_orders_id_query_parameters.g.dart'; // PostOrdersIdQueryParameters

@freezed
abstract class PostOrdersIdQueryParameters with _$PostOrdersIdQueryParameters {
  const PostOrdersIdQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdQueryParameters;

  factory PostOrdersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostOrdersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
