/// DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters
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
part 'delete_exchanges_id_outbound_shipping_method_action_id_query_parameters.freezed.dart';
part 'delete_exchanges_id_outbound_shipping_method_action_id_query_parameters.g.dart'; // DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters

@freezed
abstract class DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters
    with _$DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters {
  const DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters;

  factory DeleteExchangesIdOutboundShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteExchangesIdOutboundShippingMethodActionIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
