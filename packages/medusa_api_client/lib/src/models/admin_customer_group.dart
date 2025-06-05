/// AdminCustomerGroup
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The customer group's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The customer group's name.",
///             "title": "name"
///         },
///         "customers": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The customer group's customers."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The customer group's metadata, used to store custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The customer group's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The customer group's update date.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "customers",
///         "id",
///         "name",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The customer group's details."
/// }
library;

import 'exports.dart';
part 'admin_customer_group.freezed.dart';
part 'admin_customer_group.g.dart'; // AdminCustomerGroup

@freezed
abstract class AdminCustomerGroup with _$AdminCustomerGroup {
  const AdminCustomerGroup._();

  @jsonSerializable
  const factory AdminCustomerGroup({
    /// id
    @JsonKey(name: AdminCustomerGroup.idKey) required String id,

    /// name
    @JsonKey(name: AdminCustomerGroup.nameKey) required String name,

    /// customers
    @JsonKey(name: AdminCustomerGroup.customersKey)
    required List<Map<String, dynamic>> customers,

    /// metadata
    @JsonKey(name: AdminCustomerGroup.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminCustomerGroup.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCustomerGroup.updatedAtKey) required DateTime updatedAt,
  }) = _AdminCustomerGroup;

  factory AdminCustomerGroup.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerGroupFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String customersKey = r'customers';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
