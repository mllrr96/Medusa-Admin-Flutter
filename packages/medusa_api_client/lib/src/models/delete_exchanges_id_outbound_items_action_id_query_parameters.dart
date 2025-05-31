/// DeleteExchangesIdOutboundItemsActionIdQueryParameters
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
part 'delete_exchanges_id_outbound_items_action_id_query_parameters.freezed.dart';
part 'delete_exchanges_id_outbound_items_action_id_query_parameters.g.dart'; // DeleteExchangesIdOutboundItemsActionIdQueryParameters

@freezed
abstract class DeleteExchangesIdOutboundItemsActionIdQueryParameters
    with _$DeleteExchangesIdOutboundItemsActionIdQueryParameters {
  const DeleteExchangesIdOutboundItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteExchangesIdOutboundItemsActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: DeleteExchangesIdOutboundItemsActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _DeleteExchangesIdOutboundItemsActionIdQueryParameters;

  factory DeleteExchangesIdOutboundItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteExchangesIdOutboundItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
