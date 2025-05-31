/// PostExchangesIdOutboundItemsActionIdQueryParameters
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
part 'post_exchanges_id_outbound_items_action_id_query_parameters.freezed.dart';
part 'post_exchanges_id_outbound_items_action_id_query_parameters.g.dart'; // PostExchangesIdOutboundItemsActionIdQueryParameters

@freezed
abstract class PostExchangesIdOutboundItemsActionIdQueryParameters
    with _$PostExchangesIdOutboundItemsActionIdQueryParameters {
  const PostExchangesIdOutboundItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdOutboundItemsActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: PostExchangesIdOutboundItemsActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostExchangesIdOutboundItemsActionIdQueryParameters;

  factory PostExchangesIdOutboundItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdOutboundItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
