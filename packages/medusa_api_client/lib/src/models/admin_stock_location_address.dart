/// AdminStockLocationAddress
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The address's ID.",
///             "title": "id"
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
///         "company": {
///             "type": "string",
///             "description": "The address's company.",
///             "title": "company"
///         },
///         "country_code": {
///             "type": "string",
///             "description": "The address's country code.",
///             "title": "country_code"
///         },
///         "city": {
///             "type": "string",
///             "description": "The address's city.",
///             "title": "city"
///         },
///         "phone": {
///             "type": "string",
///             "description": "The address's phone.",
///             "title": "phone"
///         },
///         "postal_code": {
///             "type": "string",
///             "description": "The address's postal code.",
///             "title": "postal_code"
///         },
///         "province": {
///             "type": "string",
///             "description": "The address's lower-case ISO 3166-2 province code.",
///             "title": "province"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "address_1",
///         "address_2",
///         "company",
///         "country_code",
///         "city",
///         "phone",
///         "postal_code",
///         "province"
///     ],
///     "description": "The details of the stock location address."
/// }
library;

import 'exports.dart';
part 'admin_stock_location_address.freezed.dart';
part 'admin_stock_location_address.g.dart'; // AdminStockLocationAddress

@freezed
abstract class AdminStockLocationAddress with _$AdminStockLocationAddress {
  const AdminStockLocationAddress._();

  @jsonSerializable
  const factory AdminStockLocationAddress({
    /// id
    @JsonKey(name: AdminStockLocationAddress.idKey) required String id,

    /// address1
    @JsonKey(name: AdminStockLocationAddress.address1Key)
    required String address1,

    /// address2
    @JsonKey(name: AdminStockLocationAddress.address2Key)
    required String address2,

    /// company
    @JsonKey(name: AdminStockLocationAddress.companyKey)
    required String company,

    /// countryCode
    @JsonKey(name: AdminStockLocationAddress.countryCodeKey)
    required String countryCode,

    /// city
    @JsonKey(name: AdminStockLocationAddress.cityKey) required String city,

    /// phone
    @JsonKey(name: AdminStockLocationAddress.phoneKey) required String phone,

    /// postalCode
    @JsonKey(name: AdminStockLocationAddress.postalCodeKey)
    required String postalCode,

    /// province
    @JsonKey(name: AdminStockLocationAddress.provinceKey)
    required String province,
  }) = _AdminStockLocationAddress;

  factory AdminStockLocationAddress.fromJson(Map<String, dynamic> json) =>
      _$AdminStockLocationAddressFromJson(json);

  static const String idKey = r'id';

  static const String address1Key = r'address_1';

  static const String address2Key = r'address_2';

  static const String companyKey = r'company';

  static const String countryCodeKey = r'country_code';

  static const String cityKey = r'city';

  static const String phoneKey = r'phone';

  static const String postalCodeKey = r'postal_code';

  static const String provinceKey = r'province';
}
