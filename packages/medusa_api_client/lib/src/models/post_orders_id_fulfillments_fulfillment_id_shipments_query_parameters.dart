/// PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters
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
part 'post_orders_id_fulfillments_fulfillment_id_shipments_query_parameters.freezed.dart';
part 'post_orders_id_fulfillments_fulfillment_id_shipments_query_parameters.g.dart'; // PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters

@freezed
abstract class PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters
    with _$PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters {
  const PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters({
    /// fields
    @JsonKey(
      name: PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters;

  factory PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdFulfillmentsFulfillmentIdShipmentsQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
