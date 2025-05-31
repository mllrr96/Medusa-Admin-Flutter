/// GetCustomerGroupsIdQueryParameters
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
part 'get_customer_groups_id_query_parameters.freezed.dart';
part 'get_customer_groups_id_query_parameters.g.dart'; // GetCustomerGroupsIdQueryParameters

@freezed
abstract class GetCustomerGroupsIdQueryParameters
    with _$GetCustomerGroupsIdQueryParameters {
  const GetCustomerGroupsIdQueryParameters._();

  @jsonSerializable
  const factory GetCustomerGroupsIdQueryParameters({
    /// fields
    @JsonKey(name: GetCustomerGroupsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetCustomerGroupsIdQueryParameters;

  factory GetCustomerGroupsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetCustomerGroupsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
