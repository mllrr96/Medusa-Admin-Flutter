/// PostOrdersIdTransferCancelQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_orders_id_transfer_cancel_query_parameters.freezed.dart';
part 'post_orders_id_transfer_cancel_query_parameters.g.dart'; // PostOrdersIdTransferCancelQueryParameters

@freezed
abstract class PostOrdersIdTransferCancelQueryParameters
    with _$PostOrdersIdTransferCancelQueryParameters {
  const PostOrdersIdTransferCancelQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdTransferCancelQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdTransferCancelQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdTransferCancelQueryParameters;

  factory PostOrdersIdTransferCancelQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdTransferCancelQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
