/// DeleteReturnsIdDismissItemsActionIdQueryParameters
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
part 'delete_returns_id_dismiss_items_action_id_query_parameters.freezed.dart';
part 'delete_returns_id_dismiss_items_action_id_query_parameters.g.dart'; // DeleteReturnsIdDismissItemsActionIdQueryParameters

@freezed
abstract class DeleteReturnsIdDismissItemsActionIdQueryParameters
    with _$DeleteReturnsIdDismissItemsActionIdQueryParameters {
  const DeleteReturnsIdDismissItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteReturnsIdDismissItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteReturnsIdDismissItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteReturnsIdDismissItemsActionIdQueryParameters;

  factory DeleteReturnsIdDismissItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteReturnsIdDismissItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
