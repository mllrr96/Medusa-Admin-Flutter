import 'package:equatable/equatable.dart';
import 'package:medusa_admin/app/data/models/store/region.dart';

import 'discount_rule.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'discount.g.dart';

@CopyWith()
class Discount extends Equatable {
  final String? id;
  final String? code;
  final bool? isDynamic;
  final String? ruleId;
  final DiscountRule? rule;
  final bool? isDisabled;
  final String? parentDiscountId;
  final Discount? parentDiscount;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final String? validDuration;
  final List<Region>? regions;
  final int? usageLimit;
  final int usageCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  const Discount({
    this.id,
    this.code,
    this.isDynamic,
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
    this.metadata,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    List<Region>? regions;
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions']!.forEach((v) => regions!.add(Region.fromJson(v)));
    }
    return Discount(
      code: json['code'],
      isDynamic: json['is_dynamic'],
      id: json['id'],
      ruleId: json['rule_id'],
      rule: json['rule'] != null ? DiscountRule.fromJson(json['rule']) : null,
      isDisabled: json['is_disabled'],
      parentDiscountId: json['parent_discount_id'],
      parentDiscount: json['parent_discount'] != null ? Discount.fromJson(json['parent_discount']) : null,
      startsAt: DateTime.tryParse(json['starts_at'] ?? ''),
      endsAt: DateTime.tryParse(json['ends_at'] ?? ''),
      validDuration: json['valid_duration'],
      regions: regions,
      usageLimit: json['usage_limit'],
      usageCount: json['usage_count'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
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

  bool equal(Discount discount) {
    if (id == discount.id &&
        isDynamic == discount.isDynamic &&
        code == discount.code &&
        ruleId == discount.ruleId &&
        isDisabled == discount.isDisabled &&
        parentDiscountId == discount.parentDiscountId &&
        (startsAt?.isAtSameMomentAs(discount.startsAt ?? DateTime(1999)) ?? false) &&
        (endsAt?.isAtSameMomentAs(discount.endsAt ?? DateTime(1999)) ?? false) &&
        validDuration == discount.validDuration &&
        regions?.map((e) => e.id!) == discount.regions?.map((e) => e.id!) &&
        usageLimit == discount.usageLimit &&
        metadata == discount.metadata) {}

    return false;
  }

  @override
  List<Object?> get props => [
        id,
        isDynamic,
        isDisabled,
        code,
        ruleId,
        parentDiscountId,
        startsAt,
        endsAt,
        validDuration,
        usageLimit,
        usageCount,
        metadata,
      ];
}
