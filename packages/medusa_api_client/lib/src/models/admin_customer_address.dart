/// AdminCustomerAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The address's ID.",
///             "title": "id"
///         },
///         "address_name": {
///             "type": "string",
///             "description": "The address's name.",
///             "title": "address_name"
///         },
///         "is_default_shipping": {
///             "type": "boolean",
///             "description": "Whether the address is the default shipping address.",
///             "title": "is_default_shipping"
///         },
///         "is_default_billing": {
///             "type": "boolean",
///             "description": "Whether the address is the default billing address.",
///             "title": "is_default_billing"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that this address belongs to.",
///             "title": "customer_id"
///         },
///         "company": {
///             "type": "string",
///             "description": "The customer's company.",
///             "title": "company"
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
///         "address_1": {
///             "type": "string",
///             "description": "The address's first line.",
///             "title": "address_1"
///         },
///         "address_2": {
///             "type": "string",
///             "description": "The address's second line.",
///             "title": "address_2"
///         },
///         "city": {
///             "type": "string",
///             "description": "The address's city.",
///             "title": "city"
///         },
///         "country_code": {
///             "type": "string",
///             "description": "The address's country code.",
///             "title": "country_code"
///         },
///         "province": {
///             "type": "string",
///             "description": "The address's lower-case ISO 3166-2 province code.",
///             "title": "province"
///         },
///         "postal_code": {
///             "type": "string",
///             "description": "The address's postal code.",
///             "title": "postal_code"
///         },
///         "phone": {
///             "type": "string",
///             "description": "The address's phone.",
///             "title": "phone"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The address's metadata, used to store custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The address's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The address's update date.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "address_name",
///         "is_default_shipping",
///         "is_default_billing",
///         "customer_id",
///         "company",
///         "first_name",
///         "last_name",
///         "address_1",
///         "address_2",
///         "city",
///         "country_code",
///         "province",
///         "postal_code",
///         "phone",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The customer's address."
/// }
library admin_customer_address;

import 'exports.dart';
part 'admin_customer_address.freezed.dart';
part 'admin_customer_address.g.dart'; // AdminCustomerAddress

@freezed
abstract class AdminCustomerAddress with _$AdminCustomerAddress {
  const AdminCustomerAddress._();

  @jsonSerializable
  const factory AdminCustomerAddress({
    /// id
    @JsonKey(name: AdminCustomerAddress.idKey) required String id,

    /// addressName
    @JsonKey(name: AdminCustomerAddress.addressNameKey)
    required String addressName,

    /// isDefaultShipping
    @JsonKey(name: AdminCustomerAddress.isDefaultShippingKey)
    required bool isDefaultShipping,

    /// isDefaultBilling
    @JsonKey(name: AdminCustomerAddress.isDefaultBillingKey)
    required bool isDefaultBilling,

    /// customerId
    @JsonKey(name: AdminCustomerAddress.customerIdKey)
    required String customerId,

    /// company
    @JsonKey(name: AdminCustomerAddress.companyKey) required String company,

    /// firstName
    @JsonKey(name: AdminCustomerAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: AdminCustomerAddress.lastNameKey) required String lastName,

    /// address1
    @JsonKey(name: AdminCustomerAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: AdminCustomerAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: AdminCustomerAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: AdminCustomerAddress.countryCodeKey)
    required String countryCode,

    /// province
    @JsonKey(name: AdminCustomerAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: AdminCustomerAddress.postalCodeKey)
    required String postalCode,

    /// phone
    @JsonKey(name: AdminCustomerAddress.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: AdminCustomerAddress.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminCustomerAddress.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminCustomerAddress.updatedAtKey)
    required DateTime updatedAt,
  }) = _AdminCustomerAddress;

  factory AdminCustomerAddress.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerAddressFromJson(json);

  static const String idKey = r'id';

  static const String addressNameKey = r'address_name';

  static const String isDefaultShippingKey = r'is_default_shipping';

  static const String isDefaultBillingKey = r'is_default_billing';

  static const String customerIdKey = r'customer_id';

  static const String companyKey = r'company';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String address1Key = r'address_1';

  static const String address2Key = r'address_2';

  static const String cityKey = r'city';

  static const String countryCodeKey = r'country_code';

  static const String provinceKey = r'province';

  static const String postalCodeKey = r'postal_code';

  static const String phoneKey = r'phone';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
