/// AdminCustomer
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The customer's ID.",
///             "title": "id"
///         },
///         "has_account": {
///             "type": "boolean",
///             "description": "Whether the customer is registered.",
///             "title": "has_account"
///         },
///         "groups": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCustomerGroup"
///             },
///             "description": "The customer's groups."
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The customer's email.",
///             "title": "email"
///         },
///         "default_billing_address_id": {
///             "type": "string",
///             "description": "The ID of the address used as the default billing address.",
///             "title": "default_billing_address_id"
///         },
///         "default_shipping_address_id": {
///             "type": "string",
///             "description": "The ID of the address used as the default shipping address.",
///             "title": "default_shipping_address_id"
///         },
///         "company_name": {
///             "type": "string",
///             "description": "The customer's company name.",
///             "title": "company_name"
///         },
///         "first_name": {
///             "type": "string",
///             "description": "The customer's first name.",
///             "title": "first_name"
///         },
///         "last_name": {
///             "type": "string",
///             "description": "The customer's last name.",
///             "title": "last_name"
///         },
///         "addresses": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCustomerAddress"
///             },
///             "description": "The customer's addresses."
///         },
///         "phone": {
///             "type": "string",
///             "description": "The customer's phone.",
///             "title": "phone"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The customer's metadata, used to store custom key-value pairs."
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created this customer, if available.",
///             "title": "created_by"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The customer's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The customer's update date.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The customer's deletion date.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "has_account",
///         "addresses",
///         "id",
///         "email",
///         "default_billing_address_id",
///         "default_shipping_address_id",
///         "company_name",
///         "first_name",
///         "last_name"
///     ],
///     "description": "The customer's details."
/// }
library;

import 'exports.dart';
part 'admin_customer.freezed.dart';
part 'admin_customer.g.dart'; // AdminCustomer

@freezed
abstract class AdminCustomer with _$AdminCustomer {
  const AdminCustomer._();

  @jsonSerializable
  const factory AdminCustomer({
    /// id
    @JsonKey(name: AdminCustomer.idKey) required String id,

    /// hasAccount
    @JsonKey(name: AdminCustomer.hasAccountKey) required bool hasAccount,

    /// groups
    @JsonKey(name: AdminCustomer.groupsKey)
    required List<AdminCustomerGroup> groups,

    /// email
    @JsonKey(name: AdminCustomer.emailKey) required String email,

    /// defaultBillingAddressId
    @JsonKey(name: AdminCustomer.defaultBillingAddressIdKey)
    required String defaultBillingAddressId,

    /// defaultShippingAddressId
    @JsonKey(name: AdminCustomer.defaultShippingAddressIdKey)
    required String defaultShippingAddressId,

    /// companyName
    @JsonKey(name: AdminCustomer.companyNameKey) required String companyName,

    /// firstName
    @JsonKey(name: AdminCustomer.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: AdminCustomer.lastNameKey) required String lastName,

    /// addresses
    @JsonKey(name: AdminCustomer.addressesKey)
    required List<AdminCustomerAddress> addresses,

    /// phone
    @JsonKey(name: AdminCustomer.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: AdminCustomer.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdBy
    @JsonKey(name: AdminCustomer.createdByKey) required String createdBy,

    /// createdAt
    @JsonKey(name: AdminCustomer.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCustomer.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminCustomer.deletedAtKey) required DateTime deletedAt,
  }) = _AdminCustomer;

  factory AdminCustomer.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerFromJson(json);

  static const String idKey = r'id';

  static const String hasAccountKey = r'has_account';

  static const String groupsKey = r'groups';

  static const String emailKey = r'email';

  static const String defaultBillingAddressIdKey =
      r'default_billing_address_id';

  static const String defaultShippingAddressIdKey =
      r'default_shipping_address_id';

  static const String companyNameKey = r'company_name';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String addressesKey = r'addresses';

  static const String phoneKey = r'phone';

  static const String metadataKey = r'metadata';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
