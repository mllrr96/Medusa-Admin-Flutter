import 'discount_condition.dart';

class DiscountRule {
  String? id;
  DiscountRuleType? type;
  String? description;

  /// The value that the discount represents; this will depend on the type of the discount
  int? value;
  AllocationType? allocation;
  List<DiscountCondition>? conditions;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  DiscountRule({
    this.id,
    required this.type,
    this.description,
    required this.value,
    this.allocation,
    this.conditions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  DiscountRule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = DiscountRuleType.values.firstWhere((e) => e.value == (json['type'] ?? ''));
    description = json['description'];
    value = json['value'];
    if (AllocationType.values.any((e) => e.value == (json['allocation'] ?? ''))) {
      allocation = AllocationType.values.firstWhere((e) => e.value == (json['allocation'] ?? ''));
    }
    if (json['conditions'] != null) {
      conditions = <DiscountCondition>[];
      json['conditions'].forEach((e) => conditions!.add(DiscountCondition.fromJson(e)));
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
