/// PostCustomersIdCustomerGroupsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_customers_id_customer_groups_query_parameters.freezed.dart';
part 'post_customers_id_customer_groups_query_parameters.g.dart'; // PostCustomersIdCustomerGroupsQueryParameters

@freezed
abstract class PostCustomersIdCustomerGroupsQueryParameters
    with _$PostCustomersIdCustomerGroupsQueryParameters {
  const PostCustomersIdCustomerGroupsQueryParameters._();

  @jsonSerializable
  const factory PostCustomersIdCustomerGroupsQueryParameters({
    /// fields
    @JsonKey(name: PostCustomersIdCustomerGroupsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCustomersIdCustomerGroupsQueryParameters;

  factory PostCustomersIdCustomerGroupsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCustomersIdCustomerGroupsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
