/// PostDraftOrdersIdQueryParameters
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
part 'post_draft_orders_id_query_parameters.freezed.dart';
part 'post_draft_orders_id_query_parameters.g.dart'; // PostDraftOrdersIdQueryParameters

@freezed
abstract class PostDraftOrdersIdQueryParameters
    with _$PostDraftOrdersIdQueryParameters {
  const PostDraftOrdersIdQueryParameters._();

  @jsonSerializable
  const factory PostDraftOrdersIdQueryParameters({
    /// fields
    @JsonKey(name: PostDraftOrdersIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostDraftOrdersIdQueryParameters;

  factory PostDraftOrdersIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostDraftOrdersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
