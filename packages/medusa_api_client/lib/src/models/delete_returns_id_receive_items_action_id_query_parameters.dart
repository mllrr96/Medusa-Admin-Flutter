/// DeleteReturnsIdReceiveItemsActionIdQueryParameters
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
part 'delete_returns_id_receive_items_action_id_query_parameters.freezed.dart';
part 'delete_returns_id_receive_items_action_id_query_parameters.g.dart'; // DeleteReturnsIdReceiveItemsActionIdQueryParameters

@freezed
abstract class DeleteReturnsIdReceiveItemsActionIdQueryParameters
    with _$DeleteReturnsIdReceiveItemsActionIdQueryParameters {
  const DeleteReturnsIdReceiveItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteReturnsIdReceiveItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteReturnsIdReceiveItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteReturnsIdReceiveItemsActionIdQueryParameters;

  factory DeleteReturnsIdReceiveItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteReturnsIdReceiveItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
