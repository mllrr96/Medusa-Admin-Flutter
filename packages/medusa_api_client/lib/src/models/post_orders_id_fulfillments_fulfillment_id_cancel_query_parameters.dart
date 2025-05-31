/// PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters
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
part 'post_orders_id_fulfillments_fulfillment_id_cancel_query_parameters.freezed.dart';
part 'post_orders_id_fulfillments_fulfillment_id_cancel_query_parameters.g.dart'; // PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters

@freezed
abstract class PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters
    with _$PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters {
  const PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters({
    /// fields
    @JsonKey(
      name:
          PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters;

  factory PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdFulfillmentsFulfillmentIdCancelQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
