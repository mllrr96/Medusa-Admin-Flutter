/// GetOrdersIdChangesQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data.\nif a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields.\nwithout prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_orders_id_changes_query_parameters.freezed.dart';
part 'get_orders_id_changes_query_parameters.g.dart'; // GetOrdersIdChangesQueryParameters

@freezed
abstract class GetOrdersIdChangesQueryParameters
    with _$GetOrdersIdChangesQueryParameters {
  const GetOrdersIdChangesQueryParameters._();

  @jsonSerializable
  const factory GetOrdersIdChangesQueryParameters({
    /// fields
    @JsonKey(name: GetOrdersIdChangesQueryParameters.fieldsKey)
    required String fields,
  }) = _GetOrdersIdChangesQueryParameters;

  factory GetOrdersIdChangesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetOrdersIdChangesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
