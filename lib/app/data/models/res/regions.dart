import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/fulfillment_option.dart';

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

class UserRegionRes {
  Region? region;

  UserRegionRes.fromJson(json) {
    if (json['region'] != null) {
      region = Region.fromJson(json['region']);
    }
  }
}

class UserRetrieveFulfillmentOptionsRes {
  List<FulfillmentOption>? fulfillmentOptions;

  UserRetrieveFulfillmentOptionsRes.fromJson(json) {
    if (json['fulfillment_options'] == null) return;
    fulfillmentOptions = <FulfillmentOption>[];
    json['fulfillment_options'].forEach((v) => fulfillmentOptions?.add(FulfillmentOption.fromJson(v)));
  }
}

class UserDeleteRegionRes {
  /// The ID of the deleted Region.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "region"
  final String? object;

  /// Whether or not the region were deleted.
  final bool deleted;

  UserDeleteRegionRes({required this.deleted, this.id, this.object});

  factory UserDeleteRegionRes.fromJson(json) {
    return UserDeleteRegionRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
