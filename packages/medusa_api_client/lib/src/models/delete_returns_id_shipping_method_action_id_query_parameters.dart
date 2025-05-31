/// DeleteReturnsIdShippingMethodActionIdQueryParameters
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
part 'delete_returns_id_shipping_method_action_id_query_parameters.freezed.dart';
part 'delete_returns_id_shipping_method_action_id_query_parameters.g.dart'; // DeleteReturnsIdShippingMethodActionIdQueryParameters

@freezed
abstract class DeleteReturnsIdShippingMethodActionIdQueryParameters
    with _$DeleteReturnsIdShippingMethodActionIdQueryParameters {
  const DeleteReturnsIdShippingMethodActionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteReturnsIdShippingMethodActionIdQueryParameters({
    /// fields
    @JsonKey(
      name: DeleteReturnsIdShippingMethodActionIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _DeleteReturnsIdShippingMethodActionIdQueryParameters;

  factory DeleteReturnsIdShippingMethodActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteReturnsIdShippingMethodActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
