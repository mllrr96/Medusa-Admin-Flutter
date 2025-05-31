/// PostExchangesIdInboundShippingMethodActionIdQueryParameters
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
part 'post_exchanges_id_inbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'post_exchanges_id_inbound_shipping_method_action_id_query_parameters.g.dart'; // PostExchangesIdInboundShippingMethodActionIdQueryParameters

@freezed
abstract class PostExchangesIdInboundShippingMethodActionIdQueryParameters
    with _$PostExchangesIdInboundShippingMethodActionIdQueryParameters {
  const PostExchangesIdInboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdInboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name:
          PostExchangesIdInboundShippingMethodActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostExchangesIdInboundShippingMethodActionIdQueryParameters;

  factory PostExchangesIdInboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdInboundShippingMethodActionIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
