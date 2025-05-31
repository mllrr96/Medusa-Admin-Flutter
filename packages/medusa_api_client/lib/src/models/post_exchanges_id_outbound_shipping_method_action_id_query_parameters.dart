/// PostExchangesIdOutboundShippingMethodActionIdQueryParameters
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
part 'post_exchanges_id_outbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'post_exchanges_id_outbound_shipping_method_action_id_query_parameters.g.dart'; // PostExchangesIdOutboundShippingMethodActionIdQueryParameters

@freezed
abstract class PostExchangesIdOutboundShippingMethodActionIdQueryParameters
    with _$PostExchangesIdOutboundShippingMethodActionIdQueryParameters {
  const PostExchangesIdOutboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdOutboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: PostExchangesIdOutboundShippingMethodActionIdQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _PostExchangesIdOutboundShippingMethodActionIdQueryParameters;

  factory PostExchangesIdOutboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdOutboundShippingMethodActionIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
