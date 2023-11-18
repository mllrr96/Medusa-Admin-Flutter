// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_change.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderItemChangeCWProxy {
  OrderItemChange id(String? id);

  OrderItemChange type(OrderEditItemChangeType? type);

  OrderItemChange orderEditId(String? orderEditId);

  OrderItemChange orderEdit(OrderEdit? orderEdit);

  OrderItemChange originalLineItemId(String? originalLineItemId);

  OrderItemChange originalLineItem(LineItem? originalLineItem);

  OrderItemChange lineItemId(String? lineItemId);

  OrderItemChange lineItem(LineItem? lineItem);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItemChange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItemChange(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItemChange call({
    String? id,
    OrderEditItemChangeType? type,
    String? orderEditId,
    OrderEdit? orderEdit,
    String? originalLineItemId,
    LineItem? originalLineItem,
    String? lineItemId,
    LineItem? lineItem,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderItemChange.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderItemChange.copyWith.fieldName(...)`
class _$OrderItemChangeCWProxyImpl implements _$OrderItemChangeCWProxy {
  const _$OrderItemChangeCWProxyImpl(this._value);

  final OrderItemChange _value;

  @override
  OrderItemChange id(String? id) => this(id: id);

  @override
  OrderItemChange type(OrderEditItemChangeType? type) => this(type: type);

  @override
  OrderItemChange orderEditId(String? orderEditId) =>
      this(orderEditId: orderEditId);

  @override
  OrderItemChange orderEdit(OrderEdit? orderEdit) => this(orderEdit: orderEdit);

  @override
  OrderItemChange originalLineItemId(String? originalLineItemId) =>
      this(originalLineItemId: originalLineItemId);

  @override
  OrderItemChange originalLineItem(LineItem? originalLineItem) =>
      this(originalLineItem: originalLineItem);

  @override
  OrderItemChange lineItemId(String? lineItemId) =>
      this(lineItemId: lineItemId);

  @override
  OrderItemChange lineItem(LineItem? lineItem) => this(lineItem: lineItem);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItemChange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItemChange(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItemChange call({
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? orderEditId = const $CopyWithPlaceholder(),
    Object? orderEdit = const $CopyWithPlaceholder(),
    Object? originalLineItemId = const $CopyWithPlaceholder(),
    Object? originalLineItem = const $CopyWithPlaceholder(),
    Object? lineItemId = const $CopyWithPlaceholder(),
    Object? lineItem = const $CopyWithPlaceholder(),
  }) {
    return OrderItemChange(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as OrderEditItemChangeType?,
      orderEditId: orderEditId == const $CopyWithPlaceholder()
          ? _value.orderEditId
          // ignore: cast_nullable_to_non_nullable
          : orderEditId as String?,
      orderEdit: orderEdit == const $CopyWithPlaceholder()
          ? _value.orderEdit
          // ignore: cast_nullable_to_non_nullable
          : orderEdit as OrderEdit?,
      originalLineItemId: originalLineItemId == const $CopyWithPlaceholder()
          ? _value.originalLineItemId
          // ignore: cast_nullable_to_non_nullable
          : originalLineItemId as String?,
      originalLineItem: originalLineItem == const $CopyWithPlaceholder()
          ? _value.originalLineItem
          // ignore: cast_nullable_to_non_nullable
          : originalLineItem as LineItem?,
      lineItemId: lineItemId == const $CopyWithPlaceholder()
          ? _value.lineItemId
          // ignore: cast_nullable_to_non_nullable
          : lineItemId as String?,
      lineItem: lineItem == const $CopyWithPlaceholder()
          ? _value.lineItem
          // ignore: cast_nullable_to_non_nullable
          : lineItem as LineItem?,
    );
  }
}

extension $OrderItemChangeCopyWith on OrderItemChange {
  /// Returns a callable class that can be used as follows: `instanceOfOrderItemChange.copyWith(...)` or like so:`instanceOfOrderItemChange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderItemChangeCWProxy get copyWith => _$OrderItemChangeCWProxyImpl(this);
}
