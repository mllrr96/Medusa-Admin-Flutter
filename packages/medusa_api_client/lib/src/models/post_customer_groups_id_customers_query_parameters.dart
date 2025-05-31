/// PostCustomerGroupsIdCustomersQueryParameters
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
part 'post_customer_groups_id_customers_query_parameters.freezed.dart';
part 'post_customer_groups_id_customers_query_parameters.g.dart'; // PostCustomerGroupsIdCustomersQueryParameters

@freezed
abstract class PostCustomerGroupsIdCustomersQueryParameters
    with _$PostCustomerGroupsIdCustomersQueryParameters {
  const PostCustomerGroupsIdCustomersQueryParameters._();

  @jsonSerializable
  const factory PostCustomerGroupsIdCustomersQueryParameters({
    /// fields
    @JsonKey(name: PostCustomerGroupsIdCustomersQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCustomerGroupsIdCustomersQueryParameters;

  factory PostCustomerGroupsIdCustomersQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCustomerGroupsIdCustomersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
