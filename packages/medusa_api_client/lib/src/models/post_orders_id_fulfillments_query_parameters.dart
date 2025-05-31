/// PostOrdersIdFulfillmentsQueryParameters
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
part 'post_orders_id_fulfillments_query_parameters.freezed.dart';
part 'post_orders_id_fulfillments_query_parameters.g.dart'; // PostOrdersIdFulfillmentsQueryParameters

@freezed
abstract class PostOrdersIdFulfillmentsQueryParameters
    with _$PostOrdersIdFulfillmentsQueryParameters {
  const PostOrdersIdFulfillmentsQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdFulfillmentsQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdFulfillmentsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdFulfillmentsQueryParameters;

  factory PostOrdersIdFulfillmentsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdFulfillmentsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
