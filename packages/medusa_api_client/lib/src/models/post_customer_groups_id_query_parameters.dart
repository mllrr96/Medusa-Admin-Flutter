/// PostCustomerGroupsIdQueryParameters
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
part 'post_customer_groups_id_query_parameters.freezed.dart';
part 'post_customer_groups_id_query_parameters.g.dart'; // PostCustomerGroupsIdQueryParameters

@freezed
abstract class PostCustomerGroupsIdQueryParameters
    with _$PostCustomerGroupsIdQueryParameters {
  const PostCustomerGroupsIdQueryParameters._();

  @jsonSerializable
  const factory PostCustomerGroupsIdQueryParameters({
    /// fields
    @JsonKey(name: PostCustomerGroupsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCustomerGroupsIdQueryParameters;

  factory PostCustomerGroupsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCustomerGroupsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
