/// AdminCreateCustomerGroup
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The customer group's name.",
///             "title": "name"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The customer group's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name"
///     ],
///     "description": "The customer group's details."
/// }
library admin_create_customer_group;

import 'exports.dart';
part 'admin_create_customer_group.freezed.dart';
part 'admin_create_customer_group.g.dart'; // AdminCreateCustomerGroup

@freezed
abstract class AdminCreateCustomerGroup with _$AdminCreateCustomerGroup {
  const AdminCreateCustomerGroup._();

  @jsonSerializable
  const factory AdminCreateCustomerGroup({
    /// name
    @JsonKey(name: AdminCreateCustomerGroup.nameKey) required String name,

    /// metadata
    @JsonKey(name: AdminCreateCustomerGroup.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateCustomerGroup;

  factory AdminCreateCustomerGroup.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateCustomerGroupFromJson(json);

  static const String nameKey = r'name';

  static const String metadataKey = r'metadata';
}
