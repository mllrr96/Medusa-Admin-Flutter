import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import 'customer_group.dart';
import 'discount_rule.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'discount_condition.g.dart';

@CopyWith()
class DiscountCondition extends Equatable {
  final String? id;
  final DiscountConditionType? type;
  final DiscountConditionOperator? operator;
  final String? discountRuleId;
  final DiscountRule? discountRule;
  final List<String>? products;
  final List<String>? productTypes;
  final List<String>? productTags;
  final List<String>? productCollections;
  final List<CustomerGroup>? customerGroups;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  const DiscountCondition({
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

  factory DiscountCondition.fromJson(Map<String, dynamic> json) {
    List<CustomerGroup>? customerGroups;
    if (json['customer_groups'] != null) {
      customerGroups = <CustomerGroup>[];
      json['customer_groups'].forEach((e) => customerGroups!.add(CustomerGroup.fromJson(e)));
    }
    return DiscountCondition(
      id: json['id'],
      type: json['type'] != null ? DiscountConditionType.values.firstWhere((e) => e.value == (json['type'])) : null,
      operator: json['operator'] != null
          ? DiscountConditionOperator.values.firstWhere((e) => e.value == (json['operator']))
          : null,
      discountRuleId: json['discount_rule_id'],
      discountRule: json['discount_rule'] != null ? DiscountRule.fromJson(json['discount_rule']) : null,
      products: json['products'],
      productTypes: json['product_types'],
      productTags: json['product_tags'],
      productCollections: json['product_collections'],
      customerGroups: customerGroups,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
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

  @override
  List<Object?> get props => [
        id,
        type,
        operator,
        discountRuleId,
        discountRule,
        products,
        productTypes,
        productTags,
        productCollections,
        customerGroups,
        createdAt,
        updatedAt,
        deletedAt,
        metadata,
      ];
}
