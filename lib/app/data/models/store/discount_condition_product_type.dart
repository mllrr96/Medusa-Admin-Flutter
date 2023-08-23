
import 'package:medusa_admin/app/data/models/store/product_type.dart';

import 'discount_condition.dart';

class DiscountConditionProductType {
  String? productTypeId;
  String? conditionId;
  ProductType? productType;
  DiscountCondition? discountCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  DiscountConditionProductType({
    required this.productTypeId,
    required this.conditionId,
    this.productType,
    this.discountCondition,
    this.createdAt,
    this.updatedAt,
    this.metadata = const {},
  });

  DiscountConditionProductType.fromJson(Map<String, dynamic> json) {
    productTypeId = json['product_type_id'];
    conditionId = json['condition_id'];
    productType = json['product_type'] != null
        ? ProductType.fromJson(json['product_type'])
        : null;
    discountCondition = json['discount_condition'] != null
        ? DiscountCondition.fromJson(json['discount_condition'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['product_type_id'] = productTypeId;
    json['condition_id'] = conditionId;
    json['product_type'] = productType?.toJson();
    json['discount_condition'] = discountCondition?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
