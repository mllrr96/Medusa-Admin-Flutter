/// GetDraftOrdersIdQueryParameters
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
part 'get_draft_orders_id_query_parameters.freezed.dart';
part 'get_draft_orders_id_query_parameters.g.dart'; // GetDraftOrdersIdQueryParameters

@freezed
abstract class GetDraftOrdersIdQueryParameters
    with _$GetDraftOrdersIdQueryParameters {
  const GetDraftOrdersIdQueryParameters._();

  @jsonSerializable
  const factory GetDraftOrdersIdQueryParameters({
    /// fields
    @JsonKey(name: GetDraftOrdersIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetDraftOrdersIdQueryParameters;

  factory GetDraftOrdersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetDraftOrdersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
