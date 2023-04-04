import 'customer_group.dart';
import 'discount_rule.dart';

class DiscountCondition {
  String? id;
  DiscountConditionType? type;
  DiscountConditionOperator? operator;
  String? discountRuleId;
  DiscountRule? discountRule;
  List<String>? products;
  List<String>? productTypes;
  List<String>? productTags;
  List<String>? productCollections;
  List<CustomerGroup>? customerGroups;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  DiscountCondition({
    this.id,
    this.type,
    this.operator,
    this.discountRuleId,
    this.discountRule,
    this.products,
    this.productTypes,
    this.productTags,
    this.productCollections,
    this.customerGroups,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  DiscountCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['type'] != null) {
      type = DiscountConditionType.values.firstWhere((e) => e.value == (json['type'] ?? ''));
    }
    if (json['operator'] != null) {
      operator = DiscountConditionOperator.values.firstWhere((e) => e.value == (json['operator'] ?? ''));
    }
    discountRuleId = json['discount_rule_id'];
    discountRule = json['discount_rule'] != null ? DiscountRule.fromJson(json['discount_rule']) : null;
    if (json['products'] != null) {
      json['products'] = products;
    }
    if (json['product_types'] != null) {
      json['product_types'] = productTypes;
    }
    if (json['product_tags'] != null) {
      json['product_tags'] = productTags;
    }
    if (json['product_collections'] != null) {
      json['product_collections'] = productCollections;
    }
    if (json['customer_groups'] != null) {
      customerGroups = <CustomerGroup>[];
      json['customer_groups'].forEach((e) => customerGroups!.add(CustomerGroup.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    // if (type != null) {
    //   json['type'] = type?.value;
    // }
    if (operator != null) {
      json['operator'] = operator?.value;
    }
    if (discountRuleId != null) {
      json['discount_rule_id'] = discountRuleId;
    }
    if (discountRule != null) {
      json['discount_rule'] = discountRule?.toJson();
    }
    if (products != null) {
      json['products'] = products;
    }
    if (productTypes != null) {
      json['product_types'] = productTypes;
    }
    if (productTags != null) {
      json['product_tags'] = productTags;
    }
    if (productCollections != null) {
      json['product_collections'] = productCollections;
    }
    if (customerGroups != null) {
      json['customer_groups'] = customerGroups;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }
    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}

enum DiscountConditionType {
  products('products'),
  productType('product_type'),
  productCollections('product_collections'),
  productTags('product_tags'),
  customerGroups('customer_groups');

  final String value;

  const DiscountConditionType(this.value);
}

enum DiscountConditionOperator {
  inn('in'),
  notIn('not_in');

  final String value;

  const DiscountConditionOperator(this.value);
}
