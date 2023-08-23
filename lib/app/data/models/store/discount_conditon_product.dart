
import 'package:medusa_admin/app/data/models/store/product.dart';

import 'discount_condition.dart';

class DiscountConditionProduct {
  String? productId;
  String? conditionId;
  Product? product;
  DiscountCondition? discountCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  DiscountConditionProduct({
    required this.productId,
    required this.conditionId,
    this.product,
    this.discountCondition,
    this.createdAt,
    this.updatedAt,
    this.metadata = const {},
  });

  DiscountConditionProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    conditionId = json['condition_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    discountCondition = json['discount_condition'] != null
        ? DiscountCondition.fromJson(json['discount_condition'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['product_id'] = productId;
    json['condition_id'] = conditionId;
    json['product'] = product?.toJson();
    json['discount_condition'] = discountCondition?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
