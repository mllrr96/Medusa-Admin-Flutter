import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';

class UserAddBatchResourcesRes {
  final Discount? discount;

  UserAddBatchResourcesRes(this.discount);

  factory UserAddBatchResourcesRes.fromJson(Map<String, dynamic> json) => UserAddBatchResourcesRes(
      json['discount'] != null ? Discount.fromJson(json['discount']) : null);
}

class UserRemoveBatchResourcesRes {
  final Discount? discount;

  UserRemoveBatchResourcesRes(this.discount);

  factory UserRemoveBatchResourcesRes.fromJson(Map<String, dynamic> json) => UserRemoveBatchResourcesRes(
      json['discount'] != null ? Discount.fromJson(json['discount']) : null);
}

class UserCreateDiscountConditionRes {
  final Discount? discount;

  UserCreateDiscountConditionRes(this.discount);

  factory UserCreateDiscountConditionRes.fromJson(Map<String, dynamic> json) => UserCreateDiscountConditionRes(
      json['discount'] != null ? Discount.fromJson(json['discount']) : null);
}

class UserRetrieveDiscountConditionRes {
  final DiscountCondition? discountCondition;

  UserRetrieveDiscountConditionRes(this.discountCondition);

  factory UserRetrieveDiscountConditionRes.fromJson(Map<String, dynamic> json) => UserRetrieveDiscountConditionRes(
      json['discount_condition'] != null ? DiscountCondition.fromJson(json['discount_condition']) : null);
}

class UserDeleteDiscountConditionRes {
  /// The ID of the deleted DiscountCondition
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "discount-condition"
  final String? object;

  /// Whether the discount condition was deleted successfully or not.
  final bool deleted;

  /// Represents a discount that can be applied to a cart for promotional purposes.
  final Discount? discount;

  UserDeleteDiscountConditionRes({
    required this.deleted,
    this.id,
    this.object,
    this.discount,
  });

  factory UserDeleteDiscountConditionRes.fromJson(json) {
    return UserDeleteDiscountConditionRes(
      deleted: json['deleted'] ?? false,
      id: json['id'],
      object: json['object'],
      discount: json['discount'] != null ? Discount.fromJson(json['discount']) : null,
    );
  }
}
