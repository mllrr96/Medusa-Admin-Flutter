import 'package:equatable/equatable.dart';

import 'discount_condition.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
part 'discount_rule.g.dart';

@CopyWith()
class DiscountRule extends Equatable {
  final String? id;
  final DiscountRuleType? type;
  final String? description;

  /// The value that the discount represents; this will depend on the type of the discount
  final int? value;
  final AllocationType? allocation;
  final List<DiscountCondition>? conditions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  const DiscountRule({
    this.id,
    this.type,
    this.description,
    this.value,
    this.allocation,
    this.conditions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory DiscountRule.fromJson(Map<String, dynamic> json) {
    List<DiscountCondition>? conditions;
    if (json['conditions'] != null) {
      conditions = <DiscountCondition>[];
      json['conditions'].forEach((e) => conditions!.add(DiscountCondition.fromJson(e)));
    }

    return DiscountRule(
      id: json['id'],
      allocation: AllocationType.values.firstWhere((e) => e.value == (json['allocation'] ?? '')),
      description: json['description'],
      conditions: conditions,
      type: DiscountRuleType.values.firstWhere((e) => e.value == (json['type'] ?? '')),
      value: json['value'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (id != null) {
      json['id'] = id;
    }
    if (type != null) {
      json['type'] = type?.value;
    }

    if (description != null) {
      json['description'] = description;
    }
    json['value'] = value;

    if (allocation != null) {
      json['allocation'] = allocation?.value;
    }

    if (conditions != null) {
      json['conditions'] = conditions?.map((e) => e.toJson()).toList();
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
        description,
        value,
        allocation,
        conditions,
        createdAt,
        updatedAt,
        deletedAt,
        metadata,
      ];
}

enum DiscountRuleType {
  fixed('fixed'),
  percentage('percentage'),
  freeShipping('free_shipping');

  final String value;

  const DiscountRuleType(this.value);
}

enum AllocationType {
  total('total'),
  item('item');

  final String value;

  const AllocationType(this.value);
}
