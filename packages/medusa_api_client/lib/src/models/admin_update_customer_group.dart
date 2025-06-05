/// AdminUpdateCustomerGroup
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The customer group's name.",
///             "title": "name"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The customer group's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in a customer group."
/// }
library;

import 'exports.dart';
part 'admin_update_customer_group.freezed.dart';
part 'admin_update_customer_group.g.dart'; // AdminUpdateCustomerGroup

@freezed
abstract class AdminUpdateCustomerGroup with _$AdminUpdateCustomerGroup {
  const AdminUpdateCustomerGroup._();

  @jsonSerializable
  const factory AdminUpdateCustomerGroup({
    /// name
    @JsonKey(name: AdminUpdateCustomerGroup.nameKey) required String name,

    /// metadata
    @JsonKey(name: AdminUpdateCustomerGroup.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateCustomerGroup;

  factory AdminUpdateCustomerGroup.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateCustomerGroupFromJson(json);

  static const String nameKey = r'name';

  static const String metadataKey = r'metadata';
}
