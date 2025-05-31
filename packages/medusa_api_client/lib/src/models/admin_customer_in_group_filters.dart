/// AdminCustomerInGroupFilters
/// {
///     "properties": {
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by customer IDs."
///                 }
///             ]
///         },
///         "email": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "format": "email",
///                     "description": "Filter by a customer's email.",
///                     "title": "email"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "format": "email",
///                         "description": "A customer's email.",
///                         "title": "email"
///                     },
///                     "description": "Filter by customer emails."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the customer's email."
///                 }
///             ]
///         },
///         "default_billing_address_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a customer's default billing address.",
///                     "title": "default_billing_address_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The ID of a customer's default billing address.",
///                         "title": "default_billing_address_id"
///                     },
///                     "description": "Filter by the IDs of a customers' default billing address."
///                 }
///             ]
///         },
///         "default_shipping_address_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a customer's default shipping address.",
///                     "title": "default_shipping_address_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The ID of a customer's default shipping address.",
///                         "title": "default_shipping_address_id"
///                     },
///                     "description": "Filter by the IDs of a customers' default shipping address."
///                 }
///             ]
///         },
///         "company_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's company name.",
///                     "title": "company_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A company name.",
///                         "title": "company_name"
///                     },
///                     "description": "Filter by customers' company names."
///                 }
///             ]
///         },
///         "first_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's first name.",
///                     "title": "first_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A first name.",
///                         "title": "first_name"
///                     },
///                     "description": "Filter by customers' first names."
///                 }
///             ]
///         },
///         "last_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's last name.",
///                     "title": "last_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A last name.",
///                         "title": "last_name"
///                     },
///                     "description": "Filter by customers' last names."
///                 }
///             ]
///         },
///         "created_by": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a user to retrieve the groups of the customers they created.",
///                     "title": "created_by"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A user's ID.",
///                         "title": "created_by"
///                     },
///                     "description": "Filter by the ID of users to retrieve the groups of the customers they created."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter the customer's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter the customer's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter the customer's deletion date."
///         }
///     },
///     "type": "object",
///     "description": "Filters to apply on customers to retrieve their groups."
/// }
library;

import 'exports.dart';
part 'admin_customer_in_group_filters.freezed.dart';
part 'admin_customer_in_group_filters.g.dart'; // AdminCustomerInGroupFilters

@freezed
abstract class AdminCustomerInGroupFilters with _$AdminCustomerInGroupFilters {
  const AdminCustomerInGroupFilters._();

  @jsonSerializable
  const factory AdminCustomerInGroupFilters({
    /// id
    @JsonKey(name: AdminCustomerInGroupFilters.idKey) required dynamic id,

    /// email
    @JsonKey(name: AdminCustomerInGroupFilters.emailKey) required dynamic email,

    /// defaultBillingAddressId
    @JsonKey(name: AdminCustomerInGroupFilters.defaultBillingAddressIdKey)
    required dynamic defaultBillingAddressId,

    /// defaultShippingAddressId
    @JsonKey(name: AdminCustomerInGroupFilters.defaultShippingAddressIdKey)
    required dynamic defaultShippingAddressId,

    /// companyName
    @JsonKey(name: AdminCustomerInGroupFilters.companyNameKey)
    required dynamic companyName,

    /// firstName
    @JsonKey(name: AdminCustomerInGroupFilters.firstNameKey)
    required dynamic firstName,

    /// lastName
    @JsonKey(name: AdminCustomerInGroupFilters.lastNameKey)
    required dynamic lastName,

    /// createdBy
    @JsonKey(name: AdminCustomerInGroupFilters.createdByKey)
    required dynamic createdBy,

    /// createdAt
    @JsonKey(name: AdminCustomerInGroupFilters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: AdminCustomerInGroupFilters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: AdminCustomerInGroupFilters.deletedAtKey)
    required Map<String, dynamic> deletedAt,
  }) = _AdminCustomerInGroupFilters;

  factory AdminCustomerInGroupFilters.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerInGroupFiltersFromJson(json);

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String defaultBillingAddressIdKey =
      r'default_billing_address_id';

  static const String defaultShippingAddressIdKey =
      r'default_shipping_address_id';

  static const String companyNameKey = r'company_name';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
