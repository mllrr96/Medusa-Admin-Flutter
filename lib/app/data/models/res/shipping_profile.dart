import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreateShippingProfileRes {
  final ShippingProfile? shippingProfile;
  UserCreateShippingProfileRes(this.shippingProfile);

  factory UserCreateShippingProfileRes.fromJson(Map<String, dynamic> json) {
    return UserCreateShippingProfileRes(json['shipping_profile']);
  }
}

class UserRetrieveShippingProfileRes {
  final ShippingProfile? shippingProfile;
  UserRetrieveShippingProfileRes(this.shippingProfile);

  factory UserRetrieveShippingProfileRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveShippingProfileRes(json['shipping_profile']);
  }
}

class UserUpdateShippingProfileRes {
  final ShippingProfile? shippingProfile;
  UserUpdateShippingProfileRes(this.shippingProfile);

  factory UserUpdateShippingProfileRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateShippingProfileRes(json['shipping_profile']);
  }
}

class UserRetrieveAllShippingProfileRes extends PaginatedResponse {
  List<ShippingProfile>? shippingProfiles;

  UserRetrieveAllShippingProfileRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['shipping_profiles'] == null) return;
    shippingProfiles = <ShippingProfile>[];
    json['shipping_profiles'].forEach((v) => shippingProfiles?.add(ShippingProfile.fromJson(v)));
  }
}

class UserDeleteShippingProfileRes {
  /// The ID of the deleted Shipping Profile.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "shipping_profile"
  final String? object;

  /// Whether or not the items were deleted.
  final bool deleted;
  UserDeleteShippingProfileRes({required this.deleted, this.id, this.object});
  factory UserDeleteShippingProfileRes.fromJson(json) {
    return UserDeleteShippingProfileRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
