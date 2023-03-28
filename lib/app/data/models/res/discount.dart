import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';

class UserAddRegionDiscountRes {
  final Discount? discount;
  UserAddRegionDiscountRes(this.discount);
  factory UserAddRegionDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserAddRegionDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserRemoveRegionDiscountRes {
  final Discount? discount;
  UserRemoveRegionDiscountRes(this.discount);
  factory UserRemoveRegionDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserRemoveRegionDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserCreateDiscountRes {
  final Discount? discount;
  UserCreateDiscountRes(this.discount);
  factory UserCreateDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserCreateDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserRetrieveDiscountRes {
  final Discount? discount;
  UserRetrieveDiscountRes(this.discount);
  factory UserRetrieveDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserUpdateDiscountRes {
  final Discount? discount;
  UserUpdateDiscountRes(this.discount);
  factory UserUpdateDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserDeleteDiscountRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "discount"
  final String? object;

  /// Whether the discount was deleted successfully or not.
  final bool deleted;

  UserDeleteDiscountRes({required this.deleted, this.id, this.object});

  factory UserDeleteDiscountRes.fromJson(json) {
    return UserDeleteDiscountRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}

class UserCreateDynamicCodeDiscountRes {
  final Discount? discount;
  UserCreateDynamicCodeDiscountRes(this.discount);
  factory UserCreateDynamicCodeDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserCreateDynamicCodeDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserGetDiscountByCodeRes {
  final Discount? discount;
  UserGetDiscountByCodeRes(this.discount);
  factory UserGetDiscountByCodeRes.fromJson(Map<String, dynamic> json) {
    return UserGetDiscountByCodeRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserDeleteDynamicCodeDiscountRes {
  final Discount? discount;
  UserDeleteDynamicCodeDiscountRes(this.discount);
  factory UserDeleteDynamicCodeDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserDeleteDynamicCodeDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserUpdateConditionDiscountRes {
  final Discount? discount;
  UserUpdateConditionDiscountRes(this.discount);
  factory UserUpdateConditionDiscountRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateConditionDiscountRes(json['discount'] != null ? Discount.fromJson(json['discount']) : null);
  }
}

class UserRetrieveDiscountsRes extends PaginatedResponse {
  List<Discount>? discounts;
  UserRetrieveDiscountsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts']!.forEach((v) => discounts!.add(Discount.fromJson(v)));
    }
  }
}
