import 'package:medusa_admin/app/data/models/store/region.dart';

import 'discount_rule.dart';

class Discount {
  String? id;
  String? code;
  bool? isDynamic;
  String? ruleId;
  DiscountRule? rule;
  bool? isDisabled;
  String? parentDiscountId;
  Discount? parentDiscount;
  DateTime? startsAt;
  DateTime? endsAt;
  String? validDuration;
  List<Region>? regions;
  int? usageLimit;
  int usageCount = 0;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Discount({
    this.id,
    required this.code,
    required this.isDynamic,
    this.ruleId,
    this.rule,
    this.isDisabled,
    this.parentDiscountId,
    this.parentDiscount,
    this.startsAt,
    this.endsAt,
    this.validDuration,
    this.regions,
    this.usageLimit,
    this.usageCount = 0,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    isDynamic = json['is_dynamic'];
    ruleId = json['rule_id'];
    rule = json['rule'] != null ? DiscountRule.fromJson(json['rule']) : null;
    isDisabled = json['is_disabled'];
    parentDiscountId = json['parent_discount_id'];
    parentDiscount = json['parent_discount'] != null ? Discount.fromJson(json['parent_discount']) : null;
    startsAt = DateTime.tryParse(json['starts_at'] ?? '');
    endsAt = DateTime.tryParse(json['ends_at'] ?? '');
    validDuration = json['valid_duration'];
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((e) => regions?.add(Region.fromJson(e)));
    }
    usageLimit = json['usage_limit'];
    usageCount = json['usage_count'] ?? 0;
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['is_dynamic'] = isDynamic;
    json['rule_id'] = ruleId;
    json['rule'] = rule;
    json['is_disabled'] = isDisabled;
    json['parent_discount_id'] = parentDiscountId;
    json['parent_discount'] = parentDiscount?.toJson() ?? {};
    json['starts_at'] = startsAt;
    json['ends_at'] = endsAt;
    json['valid_duration'] = validDuration;
    json['regions'] = regions?.map((e) => e.toJson()).toList();
    json['usage_limit'] = usageLimit;
    json['usage_count'] = usageCount;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
