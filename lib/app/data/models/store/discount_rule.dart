
import 'discount_condition.dart';

class DiscountRule {
  String? id;
  DiscountRuleType? type;
  String? description;
  int? value;
  AllocationType? allocation;
  List<DiscountCondition>? conditions;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

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
    this.metadata = const <String, dynamic>{},
  });

  DiscountRule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = DiscountRuleType.values
        .firstWhere((e) => e.value == (json['type'] ?? ''));
    description = json['description'];
    value = json['value'];
    if (AllocationType.values
        .any((e) => e.value == (json['allocation'] ?? ''))) {
      allocation = AllocationType.values
          .firstWhere((e) => e.value == (json['allocation'] ?? ''));
    }
    if (json['conditions'] != null) {
      conditions = <DiscountCondition>[];
      json['conditions']
          .forEach((e) => conditions!.add(DiscountCondition.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['description'] = description;
    json['value'] = value;
    json['allocation'] = allocation?.value;
    json['conditions'] = conditions?.map((e) => e.toJson()).toList() ?? [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
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
