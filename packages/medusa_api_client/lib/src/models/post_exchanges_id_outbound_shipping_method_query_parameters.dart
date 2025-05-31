/// PostExchangesIdOutboundShippingMethodQueryParameters
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
part 'post_exchanges_id_outbound_shipping_method_query_parameters.freezed.dart';
part 'post_exchanges_id_outbound_shipping_method_query_parameters.g.dart'; // PostExchangesIdOutboundShippingMethodQueryParameters

@freezed
abstract class PostExchangesIdOutboundShippingMethodQueryParameters
    with _$PostExchangesIdOutboundShippingMethodQueryParameters {
  const PostExchangesIdOutboundShippingMethodQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdOutboundShippingMethodQueryParameters({
    /// fields
    @JsonKey(
      name: PostExchangesIdOutboundShippingMethodQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostExchangesIdOutboundShippingMethodQueryParameters;

  factory PostExchangesIdOutboundShippingMethodQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdOutboundShippingMethodQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
