import 'package:medusa_admin/app/data/models/store/region.dart';

class Country {
  /// The country's ID
  ///
  /// Example: 109
  final int? id;

  /// The 2 character ISO code of the country in lower case
  ///
  /// Example: "it"
  ///
  /// See a list of codes at: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements
  final String? iso2;

  /// The 2 character ISO code of the country in lower case
  ///
  /// Example: "ita"
  ///
  /// See a list of codes at: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3#Officially_assigned_code_elements
  final String? iso3;

  /// The numerical ISO code for the country.
  ///
  /// Example: 380
  ///
  /// See a list of codes at: https://en.wikipedia.org/wiki/ISO_3166-1_numeric#Officially_assigned_code_elements
  final int? numCode;

  /// The normalized country name in upper case.
  ///
  /// Example: "ITALY"
  final String? name;

  /// The region ID this country is associated with.
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  final String? regionId;

  /// The country name appropriate for display.
  ///
  /// Example: "Italy"
  final String? displayName;

  /// A region object. Available if the relation region is expanded.
  final Region? region;

  const Country({
    this.id,
    required this.iso2,
    required this.iso3,
    required this.numCode,
    required this.name,
    this.regionId,
    required this.displayName,
    this.region,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      iso2: json['iso_2'],
      iso3: json['iso_3'],
      numCode: json['num_code'],
      name: json['name'],
      displayName: json['display_name'],
      regionId: json['region_id'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['iso_2'] = iso2;
    json['num_code'] = numCode;
    json['name'] = name;
    json['iso_3'] = iso3;
    json['display_name'] = displayName;
    // json['region_id'] = regionId;
    // json['region'] = region?.toJson() ?? {};
    return json;
  }
}
