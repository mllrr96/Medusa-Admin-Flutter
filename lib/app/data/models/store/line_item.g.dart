// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LineItemCWProxy {
  LineItem id(String? id);

  LineItem cartId(String? cartId);

  LineItem cart(Cart? cart);

  LineItem orderId(String? orderId);

  LineItem order(Order? order);

  LineItem swapId(String? swapId);

  LineItem swap(Swap? swap);

  LineItem claimOrderId(String? claimOrderId);

  LineItem claimOrder(ClaimOrder? claimOrder);

  LineItem taxLines(List<LineItemTaxLine>? taxLines);

  LineItem adjustments(List<LineItemAdjustment>? adjustments);

  LineItem title(String? title);

  LineItem description(String? description);

  LineItem thumbnail(String? thumbnail);

  LineItem isReturn(bool? isReturn);

  LineItem isGiftCard(bool? isGiftCard);

  LineItem shouldMerge(bool? shouldMerge);

  LineItem allowDiscounts(bool? allowDiscounts);

  LineItem hasShipping(bool? hasShipping);

  LineItem unitPrice(num? unitPrice);

  LineItem variantId(String? variantId);

  LineItem variant(ProductVariant? variant);

  LineItem quantity(int? quantity);

  LineItem fulfilledQuantity(int? fulfilledQuantity);

  LineItem returnedQuantity(int? returnedQuantity);

  LineItem shippedQuantity(int? shippedQuantity);

  LineItem refundable(int? refundable);

  LineItem subtotal(int? subtotal);

  LineItem taxTotal(int? taxTotal);

  LineItem total(int? total);

  LineItem originalTotal(int? originalTotal);

  LineItem originalTaxTotal(int? originalTaxTotal);

  LineItem discountTotal(int? discountTotal);

  LineItem giftCardTotal(int? giftCardTotal);

  LineItem includesTax(bool? includesTax);

  LineItem originalItemId(String? originalItemId);

  LineItem orderEditId(String? orderEditId);

  LineItem orderEdit(OrderEdit? orderEdit);

  LineItem createdAt(DateTime? createdAt);

  LineItem updatedAt(DateTime? updatedAt);

  LineItem metadata(Map<String, dynamic>? metadata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LineItem call({
    String? id,
    String? cartId,
    Cart? cart,
    String? orderId,
    Order? order,
    String? swapId,
    Swap? swap,
    String? claimOrderId,
    ClaimOrder? claimOrder,
    List<LineItemTaxLine>? taxLines,
    List<LineItemAdjustment>? adjustments,
    String? title,
    String? description,
    String? thumbnail,
    bool? isReturn,
    bool? isGiftCard,
    bool? shouldMerge,
    bool? allowDiscounts,
    bool? hasShipping,
    num? unitPrice,
    String? variantId,
    ProductVariant? variant,
    int? quantity,
    int? fulfilledQuantity,
    int? returnedQuantity,
    int? shippedQuantity,
    int? refundable,
    int? subtotal,
    int? taxTotal,
    int? total,
    int? originalTotal,
    int? originalTaxTotal,
    int? discountTotal,
    int? giftCardTotal,
    bool? includesTax,
    String? originalItemId,
    String? orderEditId,
    OrderEdit? orderEdit,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLineItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLineItem.copyWith.fieldName(...)`
class _$LineItemCWProxyImpl implements _$LineItemCWProxy {
  const _$LineItemCWProxyImpl(this._value);

  final LineItem _value;

  @override
  LineItem id(String? id) => this(id: id);

  @override
  LineItem cartId(String? cartId) => this(cartId: cartId);

  @override
  LineItem cart(Cart? cart) => this(cart: cart);

  @override
  LineItem orderId(String? orderId) => this(orderId: orderId);

  @override
  LineItem order(Order? order) => this(order: order);

  @override
  LineItem swapId(String? swapId) => this(swapId: swapId);

  @override
  LineItem swap(Swap? swap) => this(swap: swap);

  @override
  LineItem claimOrderId(String? claimOrderId) =>
      this(claimOrderId: claimOrderId);

  @override
  LineItem claimOrder(ClaimOrder? claimOrder) => this(claimOrder: claimOrder);

  @override
  LineItem taxLines(List<LineItemTaxLine>? taxLines) =>
      this(taxLines: taxLines);

  @override
  LineItem adjustments(List<LineItemAdjustment>? adjustments) =>
      this(adjustments: adjustments);

  @override
  LineItem title(String? title) => this(title: title);

  @override
  LineItem description(String? description) => this(description: description);

  @override
  LineItem thumbnail(String? thumbnail) => this(thumbnail: thumbnail);

  @override
  LineItem isReturn(bool? isReturn) => this(isReturn: isReturn);

  @override
  LineItem isGiftCard(bool? isGiftCard) => this(isGiftCard: isGiftCard);

  @override
  LineItem shouldMerge(bool? shouldMerge) => this(shouldMerge: shouldMerge);

  @override
  LineItem allowDiscounts(bool? allowDiscounts) =>
      this(allowDiscounts: allowDiscounts);

  @override
  LineItem hasShipping(bool? hasShipping) => this(hasShipping: hasShipping);

  @override
  LineItem unitPrice(num? unitPrice) => this(unitPrice: unitPrice);

  @override
  LineItem variantId(String? variantId) => this(variantId: variantId);

  @override
  LineItem variant(ProductVariant? variant) => this(variant: variant);

  @override
  LineItem quantity(int? quantity) => this(quantity: quantity);

  @override
  LineItem fulfilledQuantity(int? fulfilledQuantity) =>
      this(fulfilledQuantity: fulfilledQuantity);

  @override
  LineItem returnedQuantity(int? returnedQuantity) =>
      this(returnedQuantity: returnedQuantity);

  @override
  LineItem shippedQuantity(int? shippedQuantity) =>
      this(shippedQuantity: shippedQuantity);

  @override
  LineItem refundable(int? refundable) => this(refundable: refundable);

  @override
  LineItem subtotal(int? subtotal) => this(subtotal: subtotal);

  @override
  LineItem taxTotal(int? taxTotal) => this(taxTotal: taxTotal);

  @override
  LineItem total(int? total) => this(total: total);

  @override
  LineItem originalTotal(int? originalTotal) =>
      this(originalTotal: originalTotal);

  @override
  LineItem originalTaxTotal(int? originalTaxTotal) =>
      this(originalTaxTotal: originalTaxTotal);

  @override
  LineItem discountTotal(int? discountTotal) =>
      this(discountTotal: discountTotal);

  @override
  LineItem giftCardTotal(int? giftCardTotal) =>
      this(giftCardTotal: giftCardTotal);

  @override
  LineItem includesTax(bool? includesTax) => this(includesTax: includesTax);

  @override
  LineItem originalItemId(String? originalItemId) =>
      this(originalItemId: originalItemId);

  @override
  LineItem orderEditId(String? orderEditId) => this(orderEditId: orderEditId);

  @override
  LineItem orderEdit(OrderEdit? orderEdit) => this(orderEdit: orderEdit);

  @override
  LineItem createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  LineItem updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  LineItem metadata(Map<String, dynamic>? metadata) => this(metadata: metadata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LineItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? cartId = const $CopyWithPlaceholder(),
    Object? cart = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? swapId = const $CopyWithPlaceholder(),
    Object? swap = const $CopyWithPlaceholder(),
    Object? claimOrderId = const $CopyWithPlaceholder(),
    Object? claimOrder = const $CopyWithPlaceholder(),
    Object? taxLines = const $CopyWithPlaceholder(),
    Object? adjustments = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? thumbnail = const $CopyWithPlaceholder(),
    Object? isReturn = const $CopyWithPlaceholder(),
    Object? isGiftCard = const $CopyWithPlaceholder(),
    Object? shouldMerge = const $CopyWithPlaceholder(),
    Object? allowDiscounts = const $CopyWithPlaceholder(),
    Object? hasShipping = const $CopyWithPlaceholder(),
    Object? unitPrice = const $CopyWithPlaceholder(),
    Object? variantId = const $CopyWithPlaceholder(),
    Object? variant = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? fulfilledQuantity = const $CopyWithPlaceholder(),
    Object? returnedQuantity = const $CopyWithPlaceholder(),
    Object? shippedQuantity = const $CopyWithPlaceholder(),
    Object? refundable = const $CopyWithPlaceholder(),
    Object? subtotal = const $CopyWithPlaceholder(),
    Object? taxTotal = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? originalTotal = const $CopyWithPlaceholder(),
    Object? originalTaxTotal = const $CopyWithPlaceholder(),
    Object? discountTotal = const $CopyWithPlaceholder(),
    Object? giftCardTotal = const $CopyWithPlaceholder(),
    Object? includesTax = const $CopyWithPlaceholder(),
    Object? originalItemId = const $CopyWithPlaceholder(),
    Object? orderEditId = const $CopyWithPlaceholder(),
    Object? orderEdit = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? metadata = const $CopyWithPlaceholder(),
  }) {
    return LineItem(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      cartId: cartId == const $CopyWithPlaceholder()
          ? _value.cartId
          // ignore: cast_nullable_to_non_nullable
          : cartId as String?,
      cart: cart == const $CopyWithPlaceholder()
          ? _value.cart
          // ignore: cast_nullable_to_non_nullable
          : cart as Cart?,
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String?,
      order: order == const $CopyWithPlaceholder()
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as Order?,
      swapId: swapId == const $CopyWithPlaceholder()
          ? _value.swapId
          // ignore: cast_nullable_to_non_nullable
          : swapId as String?,
      swap: swap == const $CopyWithPlaceholder()
          ? _value.swap
          // ignore: cast_nullable_to_non_nullable
          : swap as Swap?,
      claimOrderId: claimOrderId == const $CopyWithPlaceholder()
          ? _value.claimOrderId
          // ignore: cast_nullable_to_non_nullable
          : claimOrderId as String?,
      claimOrder: claimOrder == const $CopyWithPlaceholder()
          ? _value.claimOrder
          // ignore: cast_nullable_to_non_nullable
          : claimOrder as ClaimOrder?,
      taxLines: taxLines == const $CopyWithPlaceholder()
          ? _value.taxLines
          // ignore: cast_nullable_to_non_nullable
          : taxLines as List<LineItemTaxLine>?,
      adjustments: adjustments == const $CopyWithPlaceholder()
          ? _value.adjustments
          // ignore: cast_nullable_to_non_nullable
          : adjustments as List<LineItemAdjustment>?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      thumbnail: thumbnail == const $CopyWithPlaceholder()
          ? _value.thumbnail
          // ignore: cast_nullable_to_non_nullable
          : thumbnail as String?,
      isReturn: isReturn == const $CopyWithPlaceholder()
          ? _value.isReturn
          // ignore: cast_nullable_to_non_nullable
          : isReturn as bool?,
      isGiftCard: isGiftCard == const $CopyWithPlaceholder()
          ? _value.isGiftCard
          // ignore: cast_nullable_to_non_nullable
          : isGiftCard as bool?,
      shouldMerge: shouldMerge == const $CopyWithPlaceholder()
          ? _value.shouldMerge
          // ignore: cast_nullable_to_non_nullable
          : shouldMerge as bool?,
      allowDiscounts: allowDiscounts == const $CopyWithPlaceholder()
          ? _value.allowDiscounts
          // ignore: cast_nullable_to_non_nullable
          : allowDiscounts as bool?,
      hasShipping: hasShipping == const $CopyWithPlaceholder()
          ? _value.hasShipping
          // ignore: cast_nullable_to_non_nullable
          : hasShipping as bool?,
      unitPrice: unitPrice == const $CopyWithPlaceholder()
          ? _value.unitPrice
          // ignore: cast_nullable_to_non_nullable
          : unitPrice as num?,
      variantId: variantId == const $CopyWithPlaceholder()
          ? _value.variantId
          // ignore: cast_nullable_to_non_nullable
          : variantId as String?,
      variant: variant == const $CopyWithPlaceholder()
          ? _value.variant
          // ignore: cast_nullable_to_non_nullable
          : variant as ProductVariant?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      fulfilledQuantity: fulfilledQuantity == const $CopyWithPlaceholder()
          ? _value.fulfilledQuantity
          // ignore: cast_nullable_to_non_nullable
          : fulfilledQuantity as int?,
      returnedQuantity: returnedQuantity == const $CopyWithPlaceholder()
          ? _value.returnedQuantity
          // ignore: cast_nullable_to_non_nullable
          : returnedQuantity as int?,
      shippedQuantity: shippedQuantity == const $CopyWithPlaceholder()
          ? _value.shippedQuantity
          // ignore: cast_nullable_to_non_nullable
          : shippedQuantity as int?,
      refundable: refundable == const $CopyWithPlaceholder()
          ? _value.refundable
          // ignore: cast_nullable_to_non_nullable
          : refundable as int?,
      subtotal: subtotal == const $CopyWithPlaceholder()
          ? _value.subtotal
          // ignore: cast_nullable_to_non_nullable
          : subtotal as int?,
      taxTotal: taxTotal == const $CopyWithPlaceholder()
          ? _value.taxTotal
          // ignore: cast_nullable_to_non_nullable
          : taxTotal as int?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      originalTotal: originalTotal == const $CopyWithPlaceholder()
          ? _value.originalTotal
          // ignore: cast_nullable_to_non_nullable
          : originalTotal as int?,
      originalTaxTotal: originalTaxTotal == const $CopyWithPlaceholder()
          ? _value.originalTaxTotal
          // ignore: cast_nullable_to_non_nullable
          : originalTaxTotal as int?,
      discountTotal: discountTotal == const $CopyWithPlaceholder()
          ? _value.discountTotal
          // ignore: cast_nullable_to_non_nullable
          : discountTotal as int?,
      giftCardTotal: giftCardTotal == const $CopyWithPlaceholder()
          ? _value.giftCardTotal
          // ignore: cast_nullable_to_non_nullable
          : giftCardTotal as int?,
      includesTax: includesTax == const $CopyWithPlaceholder()
          ? _value.includesTax
          // ignore: cast_nullable_to_non_nullable
          : includesTax as bool?,
      originalItemId: originalItemId == const $CopyWithPlaceholder()
          ? _value.originalItemId
          // ignore: cast_nullable_to_non_nullable
          : originalItemId as String?,
      orderEditId: orderEditId == const $CopyWithPlaceholder()
          ? _value.orderEditId
          // ignore: cast_nullable_to_non_nullable
          : orderEditId as String?,
      orderEdit: orderEdit == const $CopyWithPlaceholder()
          ? _value.orderEdit
          // ignore: cast_nullable_to_non_nullable
          : orderEdit as OrderEdit?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      metadata: metadata == const $CopyWithPlaceholder()
          ? _value.metadata
          // ignore: cast_nullable_to_non_nullable
          : metadata as Map<String, dynamic>?,
    );
  }
}

extension $LineItemCopyWith on LineItem {
  /// Returns a callable class that can be used as follows: `instanceOfLineItem.copyWith(...)` or like so:`instanceOfLineItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LineItemCWProxy get copyWith => _$LineItemCWProxyImpl(this);
}
