import 'package:medusa_admin_flutter/medusa_admin.dart';

class UpdateConditionReq {
  final DiscountConditionType discountConditionType;
  final DiscountCondition discountCondition;

  UpdateConditionReq(
      {required this.discountCondition, required this.discountConditionType});
}
