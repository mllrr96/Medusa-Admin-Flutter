/// AdminUpsertStockLocationAddress
/// {
///     "properties": {
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
///             "description": "The address's ISO 3166-2 province code. Must be lower-case.",
///             "title": "province"
///         }
///     },
///     "type": "object",
///     "required": [
///         "address_1",
///         "country_code"
///     ],
///     "description": "The details of the stock location address to create."
/// }
library;

import 'exports.dart';
part 'admin_upsert_stock_location_address.freezed.dart';
part 'admin_upsert_stock_location_address.g.dart'; // AdminUpsertStockLocationAddress

@freezed
abstract class AdminUpsertStockLocationAddress
    with _$AdminUpsertStockLocationAddress {
  const AdminUpsertStockLocationAddress._();

  @jsonSerializable
  const factory AdminUpsertStockLocationAddress({
    /// address1
    @JsonKey(name: AdminUpsertStockLocationAddress.address1Key)
    required String address1,

    /// address2
    @JsonKey(name: AdminUpsertStockLocationAddress.address2Key)
    required String address2,

    /// company
    @JsonKey(name: AdminUpsertStockLocationAddress.companyKey)
    required String company,

    /// countryCode
    @JsonKey(name: AdminUpsertStockLocationAddress.countryCodeKey)
    required String countryCode,

    /// city
    @JsonKey(name: AdminUpsertStockLocationAddress.cityKey)
    required String city,

    /// phone
    @JsonKey(name: AdminUpsertStockLocationAddress.phoneKey)
    required String phone,

    /// postalCode
    @JsonKey(name: AdminUpsertStockLocationAddress.postalCodeKey)
    required String postalCode,

    /// province
    @JsonKey(name: AdminUpsertStockLocationAddress.provinceKey)
    required String province,
  }) = _AdminUpsertStockLocationAddress;

  factory AdminUpsertStockLocationAddress.fromJson(Map<String, dynamic> json) =>
      _$AdminUpsertStockLocationAddressFromJson(json);

  static const String address1Key = r'address_1';

  static const String address2Key = r'address_2';

  static const String companyKey = r'company';

  static const String countryCodeKey = r'country_code';

  static const String cityKey = r'city';

  static const String phoneKey = r'phone';

  static const String postalCodeKey = r'postal_code';

  static const String provinceKey = r'province';
}
