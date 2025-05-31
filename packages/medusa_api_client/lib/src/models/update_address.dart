/// UpdateAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The ID of an existing address to update.",
///             "title": "id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that this address belongs to.",
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
///     "required": [
///         "id"
///     ],
///     "description": "The details to update in the address."
/// }
library update_address;

import 'exports.dart';
part 'update_address.freezed.dart';
part 'update_address.g.dart'; // UpdateAddress

@freezed
abstract class UpdateAddress with _$UpdateAddress {
  const UpdateAddress._();

  @jsonSerializable
  const factory UpdateAddress({
    /// id
    @JsonKey(name: UpdateAddress.idKey) required String id,

    /// customerId
    @JsonKey(name: UpdateAddress.customerIdKey) required String customerId,

    /// company
    @JsonKey(name: UpdateAddress.companyKey) required String company,

    /// firstName
    @JsonKey(name: UpdateAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: UpdateAddress.lastNameKey) required String lastName,

    /// address1
    @JsonKey(name: UpdateAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: UpdateAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: UpdateAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: UpdateAddress.countryCodeKey) required String countryCode,

    /// province
    @JsonKey(name: UpdateAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: UpdateAddress.postalCodeKey) required String postalCode,

    /// phone
    @JsonKey(name: UpdateAddress.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: UpdateAddress.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _UpdateAddress;

  factory UpdateAddress.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressFromJson(json);

  static const String idKey = r'id';

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
