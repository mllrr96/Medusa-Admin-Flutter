
import 'customer_group.dart';
import 'discount_condition.dart';

class DiscountConditionCustomerGroup {
  String? customerGroupId;
  String? conditionId;
  CustomerGroup? customerGroup;
  DiscountCondition? discountCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  DiscountConditionCustomerGroup({
    required this.customerGroupId,
    required this.conditionId,
    this.customerGroup,
    this.discountCondition,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  DiscountConditionCustomerGroup.fromJson(Map<String, dynamic> json) {
    customerGroupId = json['customer_group_id'];
    conditionId = json['condition_id'];
    customerGroup = json['customer_group'] != null
        ? CustomerGroup.fromJson(json['customer_group'])
        : null;
    discountCondition = json['discount_condition'] != null
        ? DiscountCondition.fromJson(json['discount_condition'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['customer_group_id'] = customerGroupId;
    json['condition_id'] = conditionId;
    json['customer_group'] = customerGroup?.toJson();
    json['discount_condition'] = discountCondition?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
