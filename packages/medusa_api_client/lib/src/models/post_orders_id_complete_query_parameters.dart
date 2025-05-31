/// PostOrdersIdCompleteQueryParameters
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
part 'post_orders_id_complete_query_parameters.freezed.dart';
part 'post_orders_id_complete_query_parameters.g.dart'; // PostOrdersIdCompleteQueryParameters

@freezed
abstract class PostOrdersIdCompleteQueryParameters
    with _$PostOrdersIdCompleteQueryParameters {
  const PostOrdersIdCompleteQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdCompleteQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdCompleteQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdCompleteQueryParameters;

  factory PostOrdersIdCompleteQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdCompleteQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
