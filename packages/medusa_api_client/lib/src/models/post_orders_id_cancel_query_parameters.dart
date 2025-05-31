/// PostOrdersIdCancelQueryParameters
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
part 'post_orders_id_cancel_query_parameters.freezed.dart';
part 'post_orders_id_cancel_query_parameters.g.dart'; // PostOrdersIdCancelQueryParameters

@freezed
abstract class PostOrdersIdCancelQueryParameters
    with _$PostOrdersIdCancelQueryParameters {
  const PostOrdersIdCancelQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdCancelQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdCancelQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdCancelQueryParameters;

  factory PostOrdersIdCancelQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdCancelQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
