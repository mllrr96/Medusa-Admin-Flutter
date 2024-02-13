import 'package:medusa_admin_flutter/medusa_admin.dart';

class UpdateConditionRes {
  final List<String> updatedItemIds;
  final List<String> originalItemIds;
  final DiscountConditionType discountConditionType;
  final DiscountCondition discountCondition;
  UpdateConditionRes(
      {required this.updatedItemIds,
      required this.originalItemIds,
      required this.discountCondition,
      required this.discountConditionType});
}
