import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/region.dart';

class UserRegionsRes extends PaginatedResponse {
  List<Region>? regions;

  UserRegionsRes.fromJson(json) : super.fromJson(json) {
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((v) {
        regions?.add(Region.fromJson(v));
      });
    }
  }
}

class UserRegionRes extends PaginatedResponse {
  Region? region;

  UserRegionRes.fromJson(json) : super.fromJson(json) {
    if (json['region'] != null) {
      region = Region.fromJson(json['region']);
    }
  }
}
