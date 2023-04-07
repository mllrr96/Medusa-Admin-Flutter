// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PriceListCWProxy {
  PriceList id(String? id);

  PriceList name(String? name);

  PriceList prices(List<MoneyAmount>? prices);

  PriceList description(String? description);

  PriceList type(PriceListType type);

  PriceList status(PriceListStatus status);

  PriceList startsAt(DateTime? startsAt);

  PriceList endsAt(DateTime? endsAt);

  PriceList customerGroups(List<CustomerGroup>? customerGroups);

  PriceList createdAt(DateTime? createdAt);

  PriceList updatedAt(DateTime? updatedAt);

  PriceList deletedAt(DateTime? deletedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PriceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PriceList(...).copyWith(id: 12, name: "My name")
  /// ````
  PriceList call({
    String? id,
    String? name,
    List<MoneyAmount>? prices,
    String? description,
    PriceListType? type,
    PriceListStatus? status,
    DateTime? startsAt,
    DateTime? endsAt,
    List<CustomerGroup>? customerGroups,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPriceList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPriceList.copyWith.fieldName(...)`
class _$PriceListCWProxyImpl implements _$PriceListCWProxy {
  const _$PriceListCWProxyImpl(this._value);

  final PriceList _value;

  @override
  PriceList id(String? id) => this(id: id);

  @override
  PriceList name(String? name) => this(name: name);

  @override
  PriceList prices(List<MoneyAmount>? prices) => this(prices: prices);

  @override
  PriceList description(String? description) => this(description: description);

  @override
  PriceList type(PriceListType type) => this(type: type);

  @override
  PriceList status(PriceListStatus status) => this(status: status);

  @override
  PriceList startsAt(DateTime? startsAt) => this(startsAt: startsAt);

  @override
  PriceList endsAt(DateTime? endsAt) => this(endsAt: endsAt);

  @override
  PriceList customerGroups(List<CustomerGroup>? customerGroups) =>
      this(customerGroups: customerGroups);

  @override
  PriceList createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  PriceList updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  PriceList deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PriceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PriceList(...).copyWith(id: 12, name: "My name")
  /// ````
  PriceList call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? prices = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? startsAt = const $CopyWithPlaceholder(),
    Object? endsAt = const $CopyWithPlaceholder(),
    Object? customerGroups = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
  }) {
    return PriceList(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      prices: prices == const $CopyWithPlaceholder()
          ? _value.prices
          // ignore: cast_nullable_to_non_nullable
          : prices as List<MoneyAmount>?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PriceListType,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PriceListStatus,
      startsAt: startsAt == const $CopyWithPlaceholder()
          ? _value.startsAt
          // ignore: cast_nullable_to_non_nullable
          : startsAt as DateTime?,
      endsAt: endsAt == const $CopyWithPlaceholder()
          ? _value.endsAt
          // ignore: cast_nullable_to_non_nullable
          : endsAt as DateTime?,
      customerGroups: customerGroups == const $CopyWithPlaceholder()
          ? _value.customerGroups
          // ignore: cast_nullable_to_non_nullable
          : customerGroups as List<CustomerGroup>?,
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
    );
  }
}

extension $PriceListCopyWith on PriceList {
  /// Returns a callable class that can be used as follows: `instanceOfPriceList.copyWith(...)` or like so:`instanceOfPriceList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PriceListCWProxy get copyWith => _$PriceListCWProxyImpl(this);
}
