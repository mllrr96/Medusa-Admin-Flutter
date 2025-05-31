/// PostCustomerGroupsQueryParameters
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
part 'post_customer_groups_query_parameters.freezed.dart';
part 'post_customer_groups_query_parameters.g.dart'; // PostCustomerGroupsQueryParameters

@freezed
abstract class PostCustomerGroupsQueryParameters
    with _$PostCustomerGroupsQueryParameters {
  const PostCustomerGroupsQueryParameters._();

  @jsonSerializable
  const factory PostCustomerGroupsQueryParameters({
    /// fields
    @JsonKey(name: PostCustomerGroupsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCustomerGroupsQueryParameters;

  factory PostCustomerGroupsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCustomerGroupsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
