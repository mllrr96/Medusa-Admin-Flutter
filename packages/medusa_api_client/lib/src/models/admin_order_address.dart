/// AdminOrderAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The address's ID.",
///             "title": "id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer this address belongs to.",
///             "title": "customer_id"
///         },
///         "first_name": {
///             "type": "string",
///             "description": "The address's first name.",
///             "title": "first_name"
///         },
///         "last_name": {
///             "type": "string",
///             "description": "The address's last name.",
///             "title": "last_name"
///         },
///         "phone": {
///             "type": "string",
///             "description": "The address's phone.",
///             "title": "phone"
///         },
///         "company": {
///             "type": "string",
///             "description": "The address's company.",
///             "title": "company"
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
///         "country": {
///             "$ref": "#/components/schemas/AdminRegionCountry"
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
///         "metadata": {
///             "type": "object",
///             "description": "The address's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the address was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the address was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "An order address."
/// }
library admin_order_address;

import 'exports.dart';
part 'admin_order_address.freezed.dart';
part 'admin_order_address.g.dart'; // AdminOrderAddress

@freezed
abstract class AdminOrderAddress with _$AdminOrderAddress {
  const AdminOrderAddress._();

  @jsonSerializable
  const factory AdminOrderAddress({
    /// id
    @JsonKey(name: AdminOrderAddress.idKey) required String id,

    /// customerId
    @JsonKey(name: AdminOrderAddress.customerIdKey) required String customerId,

    /// firstName
    @JsonKey(name: AdminOrderAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: AdminOrderAddress.lastNameKey) required String lastName,

    /// phone
    @JsonKey(name: AdminOrderAddress.phoneKey) required String phone,

    /// company
    @JsonKey(name: AdminOrderAddress.companyKey) required String company,

    /// address1
    @JsonKey(name: AdminOrderAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: AdminOrderAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: AdminOrderAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: AdminOrderAddress.countryCodeKey)
    required String countryCode,

    /// country
    @JsonKey(name: AdminOrderAddress.countryKey)
    required AdminRegionCountry country,

    /// province
    @JsonKey(name: AdminOrderAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: AdminOrderAddress.postalCodeKey) required String postalCode,

    /// metadata
    @JsonKey(name: AdminOrderAddress.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminOrderAddress.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrderAddress.updatedAtKey) required DateTime updatedAt,
  }) = _AdminOrderAddress;

  factory AdminOrderAddress.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderAddressFromJson(json);

  static const String idKey = r'id';

  static const String customerIdKey = r'customer_id';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String phoneKey = r'phone';

  static const String companyKey = r'company';

  static const String address1Key = r'address_1';

  static const String address2Key = r'address_2';

  static const String cityKey = r'city';

  static const String countryCodeKey = r'country_code';

  static const String countryKey = r'country';

  static const String provinceKey = r'province';

  static const String postalCodeKey = r'postal_code';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
