

import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/models/store/product_collection.dart';
import 'package:medusa_admin/app/data/models/store/product_tag.dart';
import 'package:medusa_admin/app/data/models/store/product_type.dart';

import 'customer_group.dart';
import 'discount_rule.dart';

class DiscountCondition {
  String? id;
  DiscountConditionType? type;
  DiscountConditionOperator? operator;
  String? discountRuleId;
  DiscountRule? discountRule;
  List<Product>? products;
  List<ProductType>? productTypes;
  List<ProductTag>? productTags;
  List<ProductCollection>? productCollections;
  List<CustomerGroup>? customerGroups;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  DiscountCondition({
    this.id,
    required this.type,
    required this.operator,
    required this.discountRuleId,
    this.discountRule,
    this.products,
    this.productTypes,
    this.productTags,
    this.productCollections,
    this.customerGroups,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  DiscountCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['type'] != null) {
      type = DiscountConditionType.values
          .firstWhere((e) => e.value == (json['type'] ?? ''));
    }
    if (json['operator'] != null) {
      operator = DiscountConditionOperator.values
          .firstWhere((e) => e.value == (json['operator'] ?? ''));
    }
    discountRuleId = json['discount_rule_id'];
    discountRule = json['discount_rule'] != null
        ? DiscountRule.fromJson(json['discount_rule'])
        : null;
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((e) => products!.add(Product.fromJson(e)));
    }
    if (json['product_types'] != null) {
      productTypes = <ProductType>[];
      json['product_types']
          .forEach((e) => productTypes!.add(ProductType.fromJson(e)));
    }
    if (json['product_tags'] != null) {
      productTags = <ProductTag>[];
      json['product_tags']
          .forEach((e) => productTags!.add(ProductTag.fromJson(e)));
    }
    if (json['product_collections'] != null) {
      productCollections = <ProductCollection>[];
      json['product_collections'].forEach(
          (e) => productCollections!.add(ProductCollection.fromJson(e)));
    }
    if (json['customer_groups'] != null) {
      customerGroups = <CustomerGroup>[];
      json['customer_groups']
          .forEach((e) => customerGroups!.add(CustomerGroup.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['operator'] = operator?.value;
    json['discount_rule_id'] = discountRuleId;
    json['discount_rule'] = discountRule?.toJson();
    json['products'] = products?.map((e) => e.toJson()).toList();
    json['product_types'] = productTypes?.map((e) => e.toJson()).toList();
    json['product_tags'] = productTags?.map((e) => e.toJson()).toList();
    json['product_collections'] =
        productCollections?.map((e) => e.toJson()).toList();
    json['customer_groups'] = customerGroups?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
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
