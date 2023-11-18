import 'package:copy_with_extension/copy_with_extension.dart';

import 'index.dart';
part 'line_item.g.dart';

@CopyWith()
class LineItem {
  final String? id;
  final String? cartId;
  final Cart? cart;
  final String? orderId;
  final Order? order;
  final String? swapId;
  final Swap? swap;
  final String? claimOrderId;
  final ClaimOrder? claimOrder;
  final List<LineItemTaxLine>? taxLines;
  final List<LineItemAdjustment>? adjustments;
  final String? title;
  final String? description;
  final String? thumbnail;
  final bool? isReturn;
  final bool? isGiftCard;
  final bool? shouldMerge;
  final bool? allowDiscounts;
  final bool? hasShipping;
  final num? unitPrice;
  final String? variantId;
  final ProductVariant? variant;
  final int? quantity;
  final int? fulfilledQuantity;
  final int? returnedQuantity;
  final int? shippedQuantity;
  final int? refundable;
  final int? subtotal;
  final int? taxTotal;
  final int? total;
  final int? originalTotal;
  final int? originalTaxTotal;
  final int? discountTotal;
  final int? giftCardTotal;
  final bool? includesTax;
  final String? originalItemId;
  final String? orderEditId;
  final OrderEdit? orderEdit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;

  LineItem({
    this.id,
    this.cartId,
    this.cart,
    this.orderId,
    this.order,
    this.swapId,
    this.swap,
    this.claimOrderId,
    this.claimOrder,
    this.taxLines,
    this.adjustments,
    this.title,
    this.description,
    this.thumbnail,
    this.isReturn,
    this.isGiftCard,
    this.shouldMerge,
    this.allowDiscounts,
    this.hasShipping,
    this.unitPrice,
    this.variantId,
    this.variant,
    this.quantity,
    this.fulfilledQuantity,
    this.returnedQuantity,
    this.shippedQuantity,
    this.refundable,
    this.subtotal,
    this.taxTotal,
    this.total,
    this.originalTotal,
    this.originalTaxTotal,
    this.discountTotal,
    this.giftCardTotal,
    this.includesTax,
    this.originalItemId,
    this.orderEditId,
    this.orderEdit,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) {
    List<LineItemTaxLine>? taxLines;
    List<LineItemAdjustment>? adjustments;

    if (json['tax_lines'] != null) {
      taxLines = <LineItemTaxLine>[];
      json['tax_lines'].forEach((e) => taxLines!.add(LineItemTaxLine.fromJson(e)));
    }
    if (json['adjustments'] != null) {
      adjustments = <LineItemAdjustment>[];
      json['adjustments'].forEach((e) => adjustments!.add(LineItemAdjustment.fromJson(e)));
    }
    return LineItem(
      id: json['id'],
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      swapId: json['swap_id'],
      swap: json['swap'] != null ? Swap.fromJson(json['swap']) : null,
      claimOrderId: json['claim_order_id'],
      claimOrder: json['claim_order'] != null ? ClaimOrder.fromJson(json['claim_order']) : null,
      taxLines: taxLines,
      adjustments: adjustments,
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      isReturn: json['is_return'],
      isGiftCard: json['is_giftcard'],
      shouldMerge: json['should_merge'],
      allowDiscounts: json['allow_discounts'],
      hasShipping: json['has_shipping'],
      unitPrice: json['unit_price'],
      variantId: json['variant_id'],
      variant: json['variant'] != null ? ProductVariant.fromJson(json['variant']) : null,
      quantity: json['quantity'] ?? 0,
      fulfilledQuantity: json['fulfilled_quantity'] ?? 0,
      shippedQuantity: json['shipped_quantity'] ?? 0,
      refundable: json['refundable'] ?? 0,
      subtotal: json['subtotal'] ?? 0,
      taxTotal: json['tax_total'] ?? 0,
      total: json['total'] ?? 0,
      originalTotal: json['original_total'] ?? 0,
      originalTaxTotal: json['original_tax_total'] ?? 0,
      discountTotal: json['discount_total'] ?? 0,
      giftCardTotal: json['gift_card_total'] ?? 0,
      includesTax: json['includes_tax'],
      originalItemId: json['original_item_id'],
      orderEditId: json['order_edit_id'],
      orderEdit: json['order_edit'] != null ? OrderEdit.fromJson(json['order_edit']) : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (id != null) {
      json['item_id'] = id;
    }

    if (cartId != null) {
      json['cart_id'] = cartId;
    }

    if (cart != null) {
      json['cart'] = cart?.toJson();
    }

    if (orderId != null) {
      json['order_id'] = orderId;
    }

    if (order != null) {
      json['order'] = order?.toJson();
    }

    if (swapId != null) {
      json['swap_id'] = swapId;
    }

    if (swap != null) {
      json['swap'] = swap?.toJson();
    }

    if (claimOrderId != null) {
      json['claim_order_id'] = claimOrderId;
    }

    if (claimOrder != null) {
      json['claim_order'] = claimOrder?.toJson();
    }

    if (taxLines != null) {
      json['tax_lines'] = taxLines?.map((e) => e.toJson()).toList();
    }

    if (adjustments != null) {
      json['adjustments'] = adjustments?.map((e) => e.toJson()).toList();
    }

    if (title != null) {
      json['title'] = title;
    }

    if (description != null) {
      json['description'] = description;
    }

    if (thumbnail != null) {
      json['thumbnail'] = thumbnail;
    }

    if (isReturn != null) {
      json['is_return'] = isReturn;
    }

    if (isGiftCard != null) {
      json['is_giftcard'] = isGiftCard;
    }

    if (shouldMerge != null) {
      json['should_merge'] = shouldMerge;
    }

    if (allowDiscounts != null) {
      json['allow_discounts'] = allowDiscounts;
    }

    if (hasShipping != null) {
      json['has_shipping'] = hasShipping;
    }

    if (unitPrice != null) {
      json['unit_price'] = unitPrice;
    }

    if (variantId != null) {
      json['variant_id'] = variantId;
    }

    if (variant != null) {
      json['variant'] = variant?.toJson();
    }

    if (quantity != null) {
      json['quantity'] = quantity;
    }

    if (fulfilledQuantity != null) {
      json['fulfilled_quantity'] = fulfilledQuantity;
    }

    if (shippedQuantity != null) {
      json['shipped_quantity'] = shippedQuantity;
    }

    if (refundable != null) {
      json['refundable'] = refundable;
    }

    if (subtotal != null) {
      json['subtotal'] = subtotal;
    }

    if (taxTotal != null) {
      json['tax_total'] = taxTotal;
    }

    if (total != null) {
      json['total'] = total;
    }
    if (originalTotal != null) {
      json['original_total'] = originalTotal;
    }
    if (originalTaxTotal != null) {
      json['original_tax_total'] = originalTaxTotal;
    }
    if (discountTotal != null) {
      json['discount_total'] = discountTotal;
    }
    if (giftCardTotal != null) {
      json['gift_card_total'] = giftCardTotal;
    }
    if (includesTax != null) {
      json['includes_tax'] = includesTax;
    }
    if (originalItemId != null) {
      json['original_item_id'] = originalItemId;
    }
    if (orderEditId != null) {
      json['order_edit_id'] = orderEditId;
    }
    if (orderEdit != null) {
      json['order_edit'] = orderEdit?.toJson();
    }
    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }
    if (metadata != null) {
      json['metadata'] = metadata.toString();
    }

    return json;
  }
}
