/// CreateAddress
/// {
///     "properties": {
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer this address belongs to.",
///             "title": "customer_id"
///         },
///         "company": {
///             "type": "string",
///             "description": "The address's company.",
///             "title": "company"
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
///             "description": "The address's ISO 3166-2 province code. Must be lower-case.",
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
///             "description": "The address's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The address to create."
/// }
library create_address;

import 'exports.dart';
part 'create_address.freezed.dart';
part 'create_address.g.dart'; // CreateAddress

@freezed
abstract class CreateAddress with _$CreateAddress {
  const CreateAddress._();

  @jsonSerializable
  const factory CreateAddress({
    /// customerId
    @JsonKey(name: CreateAddress.customerIdKey) required String customerId,

    /// company
    @JsonKey(name: CreateAddress.companyKey) required String company,

    /// firstName
    @JsonKey(name: CreateAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: CreateAddress.lastNameKey) required String lastName,

    /// address1
    @JsonKey(name: CreateAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: CreateAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: CreateAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: CreateAddress.countryCodeKey) required String countryCode,

    /// province
    @JsonKey(name: CreateAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: CreateAddress.postalCodeKey) required String postalCode,

    /// phone
    @JsonKey(name: CreateAddress.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: CreateAddress.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _CreateAddress;

  factory CreateAddress.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressFromJson(json);

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
}
