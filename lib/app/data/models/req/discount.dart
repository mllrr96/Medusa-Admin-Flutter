import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreateDiscountReq {
  /// A unique code that will be used to redeem the Discount
  final String code;

  /// The Discount Rule that defines how Discounts are calculated
  final DiscountRule rule;

  /// A list of Region ids representing the Regions in which the Discount can be used.
  final List<String> regionsIds;

  /// Whether the Discount should have multiple instances of itself, each with a different code.
  ///
  /// This can be useful for automatically generated codes that all have to follow a common set of rules.
  final bool? isDynamic;

  /// Whether the Discount code is disabled on creation. You will have to enable it later to make it available to Customers.
  final bool? isDisabled;

  /// The time at which the Discount should be available.
  final DateTime? startsAt;

  /// The time at which the Discount should no longer be available.
  final DateTime? endsAt;

  /// Duration the discount runs between
  ///
  /// Example: "P3Y6M4DT12H30M5S"
  final String? validDuration;

  /// Maximum times the discount can be used
  final int? usageLimit;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserCreateDiscountReq({
    required this.code,
    required this.rule,
    required this.regionsIds,
    this.isDynamic,
    this.isDisabled,
    this.startsAt,
    this.endsAt,
    this.validDuration,
    this.metadata,
    this.usageLimit,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['code'] = code;
    json['rule'] = rule.toJson();
    json['regions'] = regionsIds;

    if (isDynamic != null) {
      json['is_dynamic'] = isDynamic;
    }

    if (isDisabled != null) {
      json['is_disabled'] = isDisabled;
    }

    if (startsAt != null) {
      json['starts_at'] = startsAt.toString();
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt.toString();
    }

    if (validDuration != null) {
      json['valid_duration'] = validDuration;
    }

    if (usageLimit != null) {
      json['usage_limit'] = usageLimit;
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}

class UserUpdateDiscountReq {
  /// A unique code that will be used to redeem the Discount
  final String? code;

  /// The Discount Rule that defines how Discounts are calculated
  final DiscountRule? rule;

  /// A list of Region ids representing the Regions in which the Discount can be used.
  final List<String>? regionsIds;

  /// Whether the Discount should have multiple instances of itself, each with a different code.
  ///
  /// This can be useful for automatically generated codes that all have to follow a common set of rules.
  final bool? isDynamic;

  /// Whether the Discount code is disabled on creation. You will have to enable it later to make it available to Customers.
  final bool? isDisabled;

  /// The time at which the Discount should be available.
  final DateTime? startsAt;

  /// The time at which the Discount should no longer be available.
  final DateTime? endsAt;

  /// Duration the discount runs between
  ///
  /// Example: "P3Y6M4DT12H30M5S"
  final String? validDuration;

  /// Maximum times the discount can be used
  final int? usageLimit;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  final bool nullEndAt;

  UserUpdateDiscountReq({
    this.code,
    this.rule,
    this.regionsIds,
    this.isDynamic,
    this.isDisabled,
    this.startsAt,
    this.endsAt,
    this.validDuration,
    this.metadata,
    this.usageLimit,
    this.nullEndAt = false,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (regionsIds != null) {
      json['regions'] = regionsIds;
    }
    if (code != null) {
      json['code'] = code;
    }
    if (rule != null) {
      json['rule'] = rule!.toJson();
    }
    if (isDynamic != null) {
      json['is_dynamic'] = isDynamic;
    }

    if (isDisabled != null) {
      json['is_disabled'] = isDisabled;
    }

    if (startsAt != null) {
      json['starts_at'] = startsAt.toString();
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt.toString();
    }

    if(nullEndAt){
      json['ends_at'] = null;
    }

    if (validDuration != null) {
      json['valid_duration'] = validDuration;
    }

    if (usageLimit != null) {
      json['usage_limit'] = usageLimit;
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}

class UserCreateDynamicCodeDiscountReq {
  /// A unique code that will be used to redeem the Discount
  final String code;

  /// Maximum times the discount can be used
  final int? usageLimit;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserCreateDynamicCodeDiscountReq({required this.code, this.usageLimit, this.metadata});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['code'] = code;
    if (usageLimit != null) {
      json['usage_limit'] = usageLimit;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    return json;
  }
}

class UserUpdateConditionDiscountReq {
  /// list of product IDs if the condition is applied on products.
  final List<String>? productIds;

  /// list of product type IDs if the condition is applied on product types.
  final List<String>? productTypes;

  /// list of product collection IDs if the condition is applied on product collections.
  final List<String>? collectionIds;

  /// list of product tag IDs if the condition is applied on product tags.
  final List<String>? productTags;

  /// list of customer group IDs if the condition is applied on customer groups.
  final List<String>? customerGroupIds;

  UserUpdateConditionDiscountReq({
    this.collectionIds,
    this.customerGroupIds,
    this.productIds,
    this.productTags,
    this.productTypes,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (productIds != null) {
      json['products'] = productIds;
    }
    if (customerGroupIds != null) {
      json['customer_groups'] = customerGroupIds;
    }
    if (collectionIds != null) {
      json['product_collections'] = collectionIds;
    }
    if (productTags != null) {
      json['product_tags'] = productTags;
    }

    if (productTypes != null) {
      json['product_types'] = productTypes;
    }
    return json;
  }
}
