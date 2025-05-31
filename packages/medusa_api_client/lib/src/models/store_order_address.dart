/// StoreOrderAddress
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
///             "$ref": "#/components/schemas/StoreRegionCountry"
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
///     "description": "An order address"
/// }
library store_order_address;

import 'exports.dart';
part 'store_order_address.freezed.dart';
part 'store_order_address.g.dart'; // StoreOrderAddress

@freezed
abstract class StoreOrderAddress with _$StoreOrderAddress {
  const StoreOrderAddress._();

  @jsonSerializable
  const factory StoreOrderAddress({
    /// id
    @JsonKey(name: StoreOrderAddress.idKey) required String id,

    /// customerId
    @JsonKey(name: StoreOrderAddress.customerIdKey) required String customerId,

    /// firstName
    @JsonKey(name: StoreOrderAddress.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: StoreOrderAddress.lastNameKey) required String lastName,

    /// phone
    @JsonKey(name: StoreOrderAddress.phoneKey) required String phone,

    /// company
    @JsonKey(name: StoreOrderAddress.companyKey) required String company,

    /// address1
    @JsonKey(name: StoreOrderAddress.address1Key) required String address1,

    /// address2
    @JsonKey(name: StoreOrderAddress.address2Key) required String address2,

    /// city
    @JsonKey(name: StoreOrderAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: StoreOrderAddress.countryCodeKey)
    required String countryCode,

    /// country
    @JsonKey(name: StoreOrderAddress.countryKey)
    required StoreRegionCountry country,

    /// province
    @JsonKey(name: StoreOrderAddress.provinceKey) required String province,

    /// postalCode
    @JsonKey(name: StoreOrderAddress.postalCodeKey) required String postalCode,

    /// metadata
    @JsonKey(name: StoreOrderAddress.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreOrderAddress.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreOrderAddress.updatedAtKey) required DateTime updatedAt,
  }) = _StoreOrderAddress;

  factory StoreOrderAddress.fromJson(Map<String, dynamic> json) =>
      _$StoreOrderAddressFromJson(json);

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
