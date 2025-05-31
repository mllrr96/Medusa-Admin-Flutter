/// PostDraftOrdersQueryParameters
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
part 'post_draft_orders_query_parameters.freezed.dart';
part 'post_draft_orders_query_parameters.g.dart'; // PostDraftOrdersQueryParameters

@freezed
abstract class PostDraftOrdersQueryParameters
    with _$PostDraftOrdersQueryParameters {
  const PostDraftOrdersQueryParameters._();

  @jsonSerializable
  const factory PostDraftOrdersQueryParameters({
    /// fields
    @JsonKey(name: PostDraftOrdersQueryParameters.fieldsKey)
    required String fields,
  }) = _PostDraftOrdersQueryParameters;

  factory PostDraftOrdersQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostDraftOrdersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
