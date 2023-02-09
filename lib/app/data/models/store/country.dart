
import 'package:medusa_admin/app/data/models/store/region.dart';

class Country {
  int? id;
  String? iso2;
  String? iso3;
  int? numCode;
  String? name;
  String? regionId;
  String? displayName;
  Region? region;

  Country({
    this.id,
    required this.iso2,
    required this.iso3,
    required this.numCode,
    required this.name,
    this.regionId,
    required this.displayName,
    this.region,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iso2 = json['iso_2'];
    iso3 = json['iso_3'];
    numCode = json['num_code'];
    name = json['name'];
    displayName = json['display_name'];
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['iso_2'] = iso2;
    json['iso_3'] = iso3;
    json['num_code'] = numCode;
    json['name'] = name;
    json['display_name'] = displayName;
    json['region_id'] = regionId;
    json['region'] = region?.toJson() ?? {};
    return json;
  }
}
