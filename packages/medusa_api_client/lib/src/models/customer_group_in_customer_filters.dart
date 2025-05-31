/// CustomerGroupInCustomerFilters
/// {
///     "properties": {
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a group's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A group's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by group IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a group's name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A group's name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by group names."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the group's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the group's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the group's deletion date."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "Filter by customer groups to get their associated customers."
/// }
library;

import 'exports.dart';
part 'customer_group_in_customer_filters.freezed.dart';
part 'customer_group_in_customer_filters.g.dart'; // CustomerGroupInCustomerFilters

@freezed
abstract class CustomerGroupInCustomerFilters
    with _$CustomerGroupInCustomerFilters {
  const CustomerGroupInCustomerFilters._();

  @jsonSerializable
  const factory CustomerGroupInCustomerFilters({
    /// id
    @JsonKey(name: CustomerGroupInCustomerFilters.idKey) required dynamic id,

    /// name
    @JsonKey(name: CustomerGroupInCustomerFilters.nameKey)
    required dynamic name,

    /// createdAt
    @JsonKey(name: CustomerGroupInCustomerFilters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: CustomerGroupInCustomerFilters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: CustomerGroupInCustomerFilters.deletedAtKey)
    required Map<String, dynamic> deletedAt,
  }) = _CustomerGroupInCustomerFilters;

  factory CustomerGroupInCustomerFilters.fromJson(Map<String, dynamic> json) =>
      _$CustomerGroupInCustomerFiltersFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
