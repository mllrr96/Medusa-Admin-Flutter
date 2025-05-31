/// StoreCustomer
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The customer's ID.",
///             "title": "id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The customer's email.",
///             "title": "email"
///         },
///         "default_billing_address_id": {
///             "type": "string",
///             "description": "The ID of the address used for billing by default.",
///             "title": "default_billing_address_id"
///         },
///         "default_shipping_address_id": {
///             "type": "string",
///             "description": "The ID of the address used for shipping by default.",
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
///                 "$ref": "#/components/schemas/StoreCustomerAddress"
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
///             "description": "The customer's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the customer was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the customer was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the customer was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "addresses",
///         "id",
///         "email",
///         "company_name",
///         "first_name",
///         "last_name",
///         "default_billing_address_id",
///         "default_shipping_address_id"
///     ],
///     "description": "The customer's details."
/// }
library store_customer;

import 'exports.dart';
part 'store_customer.freezed.dart';
part 'store_customer.g.dart'; // StoreCustomer

@freezed
abstract class StoreCustomer with _$StoreCustomer {
  const StoreCustomer._();

  @jsonSerializable
  const factory StoreCustomer({
    /// id
    @JsonKey(name: StoreCustomer.idKey) required String id,

    /// email
    @JsonKey(name: StoreCustomer.emailKey) required String email,

    /// defaultBillingAddressId
    @JsonKey(name: StoreCustomer.defaultBillingAddressIdKey)
    required String defaultBillingAddressId,

    /// defaultShippingAddressId
    @JsonKey(name: StoreCustomer.defaultShippingAddressIdKey)
    required String defaultShippingAddressId,

    /// companyName
    @JsonKey(name: StoreCustomer.companyNameKey) required String companyName,

    /// firstName
    @JsonKey(name: StoreCustomer.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: StoreCustomer.lastNameKey) required String lastName,

    /// addresses
    @JsonKey(name: StoreCustomer.addressesKey)
    required List<StoreCustomerAddress> addresses,

    /// phone
    @JsonKey(name: StoreCustomer.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: StoreCustomer.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreCustomer.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCustomer.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreCustomer.deletedAtKey) required DateTime deletedAt,
  }) = _StoreCustomer;

  factory StoreCustomer.fromJson(Map<String, dynamic> json) =>
      _$StoreCustomerFromJson(json);

  static const String idKey = r'id';

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

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
