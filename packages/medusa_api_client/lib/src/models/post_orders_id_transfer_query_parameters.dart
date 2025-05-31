/// PostOrdersIdTransferQueryParameters
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
part 'post_orders_id_transfer_query_parameters.freezed.dart';
part 'post_orders_id_transfer_query_parameters.g.dart'; // PostOrdersIdTransferQueryParameters

@freezed
abstract class PostOrdersIdTransferQueryParameters
    with _$PostOrdersIdTransferQueryParameters {
  const PostOrdersIdTransferQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdTransferQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdTransferQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdTransferQueryParameters;

  factory PostOrdersIdTransferQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdTransferQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
