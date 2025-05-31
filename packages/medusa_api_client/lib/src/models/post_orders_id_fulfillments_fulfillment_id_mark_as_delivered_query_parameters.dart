/// PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters
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
part 'post_orders_id_fulfillments_fulfillment_id_mark_as_delivered_query_parameters.freezed.dart';
part 'post_orders_id_fulfillments_fulfillment_id_mark_as_delivered_query_parameters.g.dart'; // PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters

@freezed
abstract class PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters
    with _$PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters {
  const PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters({
    /// fields
    @JsonKey(
      name: PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters;

  factory PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PostOrdersIdFulfillmentsFulfillmentIdMarkAsDeliveredQueryParametersFromJson(
        json,
      );

  static const String fieldsKey = r'fields';
}
