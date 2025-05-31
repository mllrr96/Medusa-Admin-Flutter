/// PostDraftOrdersIdConvertToOrderQueryParameters
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
part 'post_draft_orders_id_convert_to_order_query_parameters.freezed.dart';
part 'post_draft_orders_id_convert_to_order_query_parameters.g.dart'; // PostDraftOrdersIdConvertToOrderQueryParameters

@freezed
abstract class PostDraftOrdersIdConvertToOrderQueryParameters
    with _$PostDraftOrdersIdConvertToOrderQueryParameters {
  const PostDraftOrdersIdConvertToOrderQueryParameters._();

  @jsonSerializable
  const factory PostDraftOrdersIdConvertToOrderQueryParameters({
    /// fields
    @JsonKey(name: PostDraftOrdersIdConvertToOrderQueryParameters.fieldsKey)
    required String fields,
  }) = _PostDraftOrdersIdConvertToOrderQueryParameters;

  factory PostDraftOrdersIdConvertToOrderQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostDraftOrdersIdConvertToOrderQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
