// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_rule.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiscountRuleCWProxy {
  DiscountRule id(String? id);

  DiscountRule type(DiscountRuleType? type);

  DiscountRule description(String? description);

  DiscountRule value(int? value);

  DiscountRule allocation(AllocationType? allocation);

  DiscountRule conditions(List<DiscountCondition>? conditions);

  DiscountRule createdAt(DateTime? createdAt);

  DiscountRule updatedAt(DateTime? updatedAt);

  DiscountRule deletedAt(DateTime? deletedAt);

  DiscountRule metadata(Map<String, dynamic>? metadata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscountRule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscountRule(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscountRule call({
    String? id,
    DiscountRuleType? type,
    String? description,
    int? value,
    AllocationType? allocation,
    List<DiscountCondition>? conditions,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    Map<String, dynamic>? metadata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiscountRule.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiscountRule.copyWith.fieldName(...)`
class _$DiscountRuleCWProxyImpl implements _$DiscountRuleCWProxy {
  const _$DiscountRuleCWProxyImpl(this._value);

  final DiscountRule _value;

  @override
  DiscountRule id(String? id) => this(id: id);

  @override
  DiscountRule type(DiscountRuleType? type) => this(type: type);

  @override
  DiscountRule description(String? description) =>
      this(description: description);

  @override
  DiscountRule value(int? value) => this(value: value);

  @override
  DiscountRule allocation(AllocationType? allocation) =>
      this(allocation: allocation);

  @override
  DiscountRule conditions(List<DiscountCondition>? conditions) =>
      this(conditions: conditions);

  @override
  DiscountRule createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  DiscountRule updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  DiscountRule deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  DiscountRule metadata(Map<String, dynamic>? metadata) =>
      this(metadata: metadata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscountRule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscountRule(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscountRule call({
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? allocation = const $CopyWithPlaceholder(),
    Object? conditions = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? metadata = const $CopyWithPlaceholder(),
  }) {
    return DiscountRule(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as DiscountRuleType?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int?,
      allocation: allocation == const $CopyWithPlaceholder()
          ? _value.allocation
          // ignore: cast_nullable_to_non_nullable
          : allocation as AllocationType?,
      conditions: conditions == const $CopyWithPlaceholder()
          ? _value.conditions
          // ignore: cast_nullable_to_non_nullable
          : conditions as List<DiscountCondition>?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
      metadata: metadata == const $CopyWithPlaceholder()
          ? _value.metadata
          // ignore: cast_nullable_to_non_nullable
          : metadata as Map<String, dynamic>?,
    );
  }
}

extension $DiscountRuleCopyWith on DiscountRule {
  /// Returns a callable class that can be used as follows: `instanceOfDiscountRule.copyWith(...)` or like so:`instanceOfDiscountRule.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiscountRuleCWProxy get copyWith => _$DiscountRuleCWProxyImpl(this);
}
