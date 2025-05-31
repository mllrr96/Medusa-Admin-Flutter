/// PostExchangesIdOutboundItemsQueryParameters
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
part 'post_exchanges_id_outbound_items_query_parameters.freezed.dart';
part 'post_exchanges_id_outbound_items_query_parameters.g.dart'; // PostExchangesIdOutboundItemsQueryParameters

@freezed
abstract class PostExchangesIdOutboundItemsQueryParameters
    with _$PostExchangesIdOutboundItemsQueryParameters {
  const PostExchangesIdOutboundItemsQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdOutboundItemsQueryParameters({
    /// fields
    @JsonKey(name: PostExchangesIdOutboundItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostExchangesIdOutboundItemsQueryParameters;

  factory PostExchangesIdOutboundItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdOutboundItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
