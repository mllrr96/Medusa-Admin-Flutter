
import 'package:medusa_admin/app/data/models/store/product_collection.dart';

import 'discount_condition.dart';

class DiscountConditionProductCollection {
  String? productCollectionId;
  String? conditionId;
  ProductCollection? productCollection;
  DiscountCondition? discountCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  DiscountConditionProductCollection({
    required this.productCollectionId,
    required this.conditionId,
    this.productCollection,
    this.discountCondition,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  DiscountConditionProductCollection.fromJson(Map<String, dynamic> json) {
    productCollectionId = json['product_collection_id'];
    conditionId = json['condition_id'];
    productCollection = json['product_collection'] != null
        ? ProductCollection.fromJson(json['product_collection'])
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
    json['product_collection_id'] = productCollectionId;
    json['condition_id'] = conditionId;
    json['product_collection'] = productCollection?.toJson() ;
    json['discount_condition'] = discountCondition?.toJson() ;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
