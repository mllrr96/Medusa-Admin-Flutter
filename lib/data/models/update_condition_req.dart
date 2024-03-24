import 'package:medusa_admin_dart_client/medusa_admin.dart';

class UpdateConditionReq {
  final DiscountConditionType discountConditionType;
  final DiscountCondition discountCondition;

  UpdateConditionReq(
      {required this.discountCondition, required this.discountConditionType});
}
