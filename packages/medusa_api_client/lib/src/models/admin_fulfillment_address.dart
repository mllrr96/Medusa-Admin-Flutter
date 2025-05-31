/// AdminFulfillmentAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The address's ID.",
///             "title": "id"
///         },
///         "fulfillment_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment that the address belongs to.",
///             "title": "fulfillment_id"
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
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the address was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "fulfillment_id",
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
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "An address's details."
/// }
library admin_fulfillment_address;

import 'exports.dart';
part 'admin_fulfillment_address.freezed.dart';
part 'admin_fulfillment_address.g.dart'; // AdminFulfillmentAddress

@freezed
abstract class AdminFulfillmentAddress with _$AdminFulfillmentAddress {
  const AdminFulfillmentAddress._();

  @jsonSerializable
  const factory AdminFulfillmentAddress({
    /// id
    @JsonKey(name: AdminFulfillmentAddress.idKey) required String id,

    /// fulfillmentId
    @JsonKey(name: AdminFulfillmentAddress.fulfillmentIdKey)
    required String fulfillmentId,

    /// company
    @JsonKey(name: AdminFulfillmentAddress.companyKey) required String company,

    /// firstName
    @JsonKey(name: AdminFulfillmentAddress.firstNameKey)
    required String firstName,

    /// lastName
    @JsonKey(name: AdminFulfillmentAddress.lastNameKey)
    required String lastName,

    /// address1
    @JsonKey(name: AdminFulfillmentAddress.address1Key)
    required String address1,

    /// address2
    @JsonKey(name: AdminFulfillmentAddress.address2Key)
    required String address2,

    /// city
    @JsonKey(name: AdminFulfillmentAddress.cityKey) required String city,

    /// countryCode
    @JsonKey(name: AdminFulfillmentAddress.countryCodeKey)
    required String countryCode,

    /// province
    @JsonKey(name: AdminFulfillmentAddress.provinceKey)
    required String province,

    /// postalCode
    @JsonKey(name: AdminFulfillmentAddress.postalCodeKey)
    required String postalCode,

    /// phone
    @JsonKey(name: AdminFulfillmentAddress.phoneKey) required String phone,

    /// metadata
    @JsonKey(name: AdminFulfillmentAddress.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminFulfillmentAddress.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminFulfillmentAddress.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminFulfillmentAddress.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminFulfillmentAddress;

  factory AdminFulfillmentAddress.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentAddressFromJson(json);

  static const String idKey = r'id';

  static const String fulfillmentIdKey = r'fulfillment_id';

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

  static const String deletedAtKey = r'deleted_at';
}
