/// StoreCartAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The address's ID.",
///             "title": "id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer the address belongs to.",
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
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The address's details."
/// }
library store_cart_address;

import 'exports.dart';
part 'store_cart_address.freezed.dart';
part 'store_cart_address.g.dart'; // StoreCartAddress

@freezed
abstract class StoreCartAddress with _$StoreCartAddress {
  const StoreCartAddress._();

  @jsonSerializable
  const factory StoreCartAddress({
    /// id
    @JsonKey(name: StoreCartAddress.idKey) required String id,

    /// customerId
    @JsonKey(name: StoreCartAddress.customerIdKey) required String customerId,

    /// firstName
    @JsonKey(name: StoreCartAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: StoreCartAddress.lastNameKey) required String lastName,

    /// phone
    @JsonKey(name: StoreCartAddress.phoneKey) required String phone,

    /// company
    @JsonKey(name: StoreCartAddress.companyKey) required String company,

    /// address1
    @JsonKey(name: StoreCartAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: StoreCartAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: StoreCartAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: StoreCartAddress.countryCodeKey) required String countryCode,

    /// province
    @JsonKey(name: StoreCartAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: StoreCartAddress.postalCodeKey) required String postalCode,

    /// metadata
    @JsonKey(name: StoreCartAddress.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreCartAddress.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCartAddress.updatedAtKey) required DateTime updatedAt,
  }) = _StoreCartAddress;

  factory StoreCartAddress.fromJson(Map<String, dynamic> json) =>
      _$StoreCartAddressFromJson(json);

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

  static const String provinceKey = r'province';

  static const String postalCodeKey = r'postal_code';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
