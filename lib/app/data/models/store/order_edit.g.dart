// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_edit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderEditCWProxy {
  OrderEdit id(String? id);

  OrderEdit orderId(String? orderId);

  OrderEdit order(Order? order);

  OrderEdit internalNote(String? internalNote);

  OrderEdit createdBy(String? createdBy);

  OrderEdit requestedBy(String? requestedBy);

  OrderEdit declinedBy(String? declinedBy);

  OrderEdit confirmedBy(String? confirmedBy);

  OrderEdit requestedAt(DateTime? requestedAt);

  OrderEdit confirmedAt(DateTime? confirmedAt);

  OrderEdit declinedAt(DateTime? declinedAt);

  OrderEdit declinedReason(String? declinedReason);

  OrderEdit subtotal(int? subtotal);

  OrderEdit discountTotal(int? discountTotal);

  OrderEdit taxTotal(int? taxTotal);

  OrderEdit total(int? total);

  OrderEdit differenceDue(int? differenceDue);

  OrderEdit items(List<LineItem>? items);

  OrderEdit status(OrderEditStatus status);

  OrderEdit paymentCollection(PaymentCollection? paymentCollection);

  OrderEdit paymentCollectionId(String? paymentCollectionId);

  OrderEdit canceledAt(DateTime? canceledAt);

  OrderEdit canceledBy(String? canceledBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderEdit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderEdit(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderEdit call({
    String? id,
    String? orderId,
    Order? order,
    String? internalNote,
    String? createdBy,
    String? requestedBy,
    String? declinedBy,
    String? confirmedBy,
    DateTime? requestedAt,
    DateTime? confirmedAt,
    DateTime? declinedAt,
    String? declinedReason,
    int? subtotal,
    int? discountTotal,
    int? taxTotal,
    int? total,
    int? differenceDue,
    List<LineItem>? items,
    OrderEditStatus? status,
    PaymentCollection? paymentCollection,
    String? paymentCollectionId,
    DateTime? canceledAt,
    String? canceledBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderEdit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderEdit.copyWith.fieldName(...)`
class _$OrderEditCWProxyImpl implements _$OrderEditCWProxy {
  const _$OrderEditCWProxyImpl(this._value);

  final OrderEdit _value;

  @override
  OrderEdit id(String? id) => this(id: id);

  @override
  OrderEdit orderId(String? orderId) => this(orderId: orderId);

  @override
  OrderEdit order(Order? order) => this(order: order);

  @override
  OrderEdit internalNote(String? internalNote) =>
      this(internalNote: internalNote);

  @override
  OrderEdit createdBy(String? createdBy) => this(createdBy: createdBy);

  @override
  OrderEdit requestedBy(String? requestedBy) => this(requestedBy: requestedBy);

  @override
  OrderEdit declinedBy(String? declinedBy) => this(declinedBy: declinedBy);

  @override
  OrderEdit confirmedBy(String? confirmedBy) => this(confirmedBy: confirmedBy);

  @override
  OrderEdit requestedAt(DateTime? requestedAt) =>
      this(requestedAt: requestedAt);

  @override
  OrderEdit confirmedAt(DateTime? confirmedAt) =>
      this(confirmedAt: confirmedAt);

  @override
  OrderEdit declinedAt(DateTime? declinedAt) => this(declinedAt: declinedAt);

  @override
  OrderEdit declinedReason(String? declinedReason) =>
      this(declinedReason: declinedReason);

  @override
  OrderEdit subtotal(int? subtotal) => this(subtotal: subtotal);

  @override
  OrderEdit discountTotal(int? discountTotal) =>
      this(discountTotal: discountTotal);

  @override
  OrderEdit taxTotal(int? taxTotal) => this(taxTotal: taxTotal);

  @override
  OrderEdit total(int? total) => this(total: total);

  @override
  OrderEdit differenceDue(int? differenceDue) =>
      this(differenceDue: differenceDue);

  @override
  OrderEdit items(List<LineItem>? items) => this(items: items);

  @override
  OrderEdit status(OrderEditStatus status) => this(status: status);

  @override
  OrderEdit paymentCollection(PaymentCollection? paymentCollection) =>
      this(paymentCollection: paymentCollection);

  @override
  OrderEdit paymentCollectionId(String? paymentCollectionId) =>
      this(paymentCollectionId: paymentCollectionId);

  @override
  OrderEdit canceledAt(DateTime? canceledAt) => this(canceledAt: canceledAt);

  @override
  OrderEdit canceledBy(String? canceledBy) => this(canceledBy: canceledBy);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderEdit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderEdit(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderEdit call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? internalNote = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
    Object? requestedBy = const $CopyWithPlaceholder(),
    Object? declinedBy = const $CopyWithPlaceholder(),
    Object? confirmedBy = const $CopyWithPlaceholder(),
    Object? requestedAt = const $CopyWithPlaceholder(),
    Object? confirmedAt = const $CopyWithPlaceholder(),
    Object? declinedAt = const $CopyWithPlaceholder(),
    Object? declinedReason = const $CopyWithPlaceholder(),
    Object? subtotal = const $CopyWithPlaceholder(),
    Object? discountTotal = const $CopyWithPlaceholder(),
    Object? taxTotal = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? differenceDue = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? paymentCollection = const $CopyWithPlaceholder(),
    Object? paymentCollectionId = const $CopyWithPlaceholder(),
    Object? canceledAt = const $CopyWithPlaceholder(),
    Object? canceledBy = const $CopyWithPlaceholder(),
  }) {
    return OrderEdit(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String?,
      order: order == const $CopyWithPlaceholder()
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as Order?,
      changes: _value.changes,
      internalNote: internalNote == const $CopyWithPlaceholder()
          ? _value.internalNote
          // ignore: cast_nullable_to_non_nullable
          : internalNote as String?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as String?,
      requestedBy: requestedBy == const $CopyWithPlaceholder()
          ? _value.requestedBy
          // ignore: cast_nullable_to_non_nullable
          : requestedBy as String?,
      declinedBy: declinedBy == const $CopyWithPlaceholder()
          ? _value.declinedBy
          // ignore: cast_nullable_to_non_nullable
          : declinedBy as String?,
      confirmedBy: confirmedBy == const $CopyWithPlaceholder()
          ? _value.confirmedBy
          // ignore: cast_nullable_to_non_nullable
          : confirmedBy as String?,
      requestedAt: requestedAt == const $CopyWithPlaceholder()
          ? _value.requestedAt
          // ignore: cast_nullable_to_non_nullable
          : requestedAt as DateTime?,
      confirmedAt: confirmedAt == const $CopyWithPlaceholder()
          ? _value.confirmedAt
          // ignore: cast_nullable_to_non_nullable
          : confirmedAt as DateTime?,
      declinedAt: declinedAt == const $CopyWithPlaceholder()
          ? _value.declinedAt
          // ignore: cast_nullable_to_non_nullable
          : declinedAt as DateTime?,
      declinedReason: declinedReason == const $CopyWithPlaceholder()
          ? _value.declinedReason
          // ignore: cast_nullable_to_non_nullable
          : declinedReason as String?,
      subtotal: subtotal == const $CopyWithPlaceholder()
          ? _value.subtotal
          // ignore: cast_nullable_to_non_nullable
          : subtotal as int?,
      discountTotal: discountTotal == const $CopyWithPlaceholder()
          ? _value.discountTotal
          // ignore: cast_nullable_to_non_nullable
          : discountTotal as int?,
      taxTotal: taxTotal == const $CopyWithPlaceholder()
          ? _value.taxTotal
          // ignore: cast_nullable_to_non_nullable
          : taxTotal as int?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      differenceDue: differenceDue == const $CopyWithPlaceholder()
          ? _value.differenceDue
          // ignore: cast_nullable_to_non_nullable
          : differenceDue as int?,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<LineItem>?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OrderEditStatus,
      paymentCollection: paymentCollection == const $CopyWithPlaceholder()
          ? _value.paymentCollection
          // ignore: cast_nullable_to_non_nullable
          : paymentCollection as PaymentCollection?,
      paymentCollectionId: paymentCollectionId == const $CopyWithPlaceholder()
          ? _value.paymentCollectionId
          // ignore: cast_nullable_to_non_nullable
          : paymentCollectionId as String?,
      canceledAt: canceledAt == const $CopyWithPlaceholder()
          ? _value.canceledAt
          // ignore: cast_nullable_to_non_nullable
          : canceledAt as DateTime?,
      canceledBy: canceledBy == const $CopyWithPlaceholder()
          ? _value.canceledBy
          // ignore: cast_nullable_to_non_nullable
          : canceledBy as String?,
    );
  }
}

extension $OrderEditCopyWith on OrderEdit {
  /// Returns a callable class that can be used as follows: `instanceOfOrderEdit.copyWith(...)` or like so:`instanceOfOrderEdit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderEditCWProxy get copyWith => _$OrderEditCWProxyImpl(this);
}
