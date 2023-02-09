import 'index.dart';


class LineItem {
  String? id;
  String? cartId;
  Cart? cart;
  String? orderId;
  Order? order;
  String? swapId;
  Swap? swap;
  String? claimOrderId;
  ClaimOrder? claimOrder;
  List<LineItemTaxLine>? taxLines;
  List<LineItemAdjustment>? adjustments;
  String? title;
  String? description;
  String? thumbnail;
  bool? isReturn;
  bool? isGiftCard;
  bool? shouldMerge;
  bool? allowDiscounts;
  bool? hasShipping;
  num? unitPrice;
  String? variantId;
  ProductVariant? variant;
  int? quantity;
  int? fulfilledQuantity;
  int? returnedQuantity;
  int? shippedQuantity;
  int? refundable;
  int? subtotal;
  int? taxTotal;
  int? total;
  int? originalTotal;
  int? originalTaxTotal;
  int? discountTotal;
  int? giftCardTotal;
  bool? includesTax;
  String? originalItemId;
  String? orderEditId;
  OrderEdit? orderEdit;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

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
    required this.title,
    this.description,
    this.thumbnail,
    this.isReturn,
    this.isGiftCard,
    this.shouldMerge,
    this.allowDiscounts,
    this.hasShipping,
    required this.unitPrice,
    this.variantId,
    this.variant,
    required this.quantity,
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
    this.metadata = const <String, dynamic>{},
  });

  LineItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart'] ?? {}) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    swapId = json['swap_id'];
    swap = json['swap'] != null ? Swap.fromJson(json['swap']) : null;
    claimOrderId = json['claim_order_id'];
    claimOrder = json['claim_order'] != null
        ? ClaimOrder.fromJson(json['claim_order'])
        : null;
    if (json['tax_lines'] != null) {
      taxLines = <LineItemTaxLine>[];
      json['tax_lines']
          .forEach((e) => taxLines!.add(LineItemTaxLine.fromJson(e)));
    }
    if (json['adjustments'] != null) {
      adjustments = <LineItemAdjustment>[];
      json['adjustments']
          .forEach((e) => adjustments!.add(LineItemAdjustment.fromJson(e)));
    }
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    isReturn = json['is_return'];
    isGiftCard = json['is_giftcard'];
    shouldMerge = json['should_merge'];
    allowDiscounts = json['allow_discounts'];
    hasShipping = json['has_shipping'];
    unitPrice = json['unit_price'];
    variantId = json['variant_id'];
    variant = json['variant'] != null
        ? ProductVariant.fromJson(json['variant'])
        : null;
    quantity = json['quantity'] ?? 0;
    fulfilledQuantity = json['fulfilled_quantity'] ?? 0;
    shippedQuantity = json['shipped_quantity'] ?? 0;
    refundable = json['refundable'] ?? 0;
    subtotal = json['subtotal'] ?? 0;
    taxTotal = json['tax_total'] ?? 0;
    total = json['total'] ?? 0;
    originalTotal = json['original_total'] ?? 0;
    originalTaxTotal = json['original_tax_total'] ?? 0;
    discountTotal = json['discount_total'] ?? 0;
    giftCardTotal = json['gift_card_total'] ?? 0;
    includesTax = json['includes_tax'];
    originalItemId = json['original_item_id'];
    orderEditId = json['order_edit_id'];
    orderEdit = json['order_edit'] != null
        ? OrderEdit.fromJson(json['order_edit'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson() ?? {};
    json['order_id'] = orderId;
    json['order'] = order?.toJson() ?? {};
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson() ?? {};
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson() ?? {};
    json['tax_lines'] = taxLines?.map((e) => e.toJson()).toList() ?? [];
    json['adjustments'] = adjustments?.map((e) => e.toJson()).toList() ?? [];
    json['title'] = title;
    json['description'] = description;
    json['thumbnail'] = thumbnail;
    json['is_return'] = isReturn;
    json['is_giftcard'] = isGiftCard;
    json['should_merge'] = shouldMerge;
    json['allow_discounts'] = allowDiscounts;
    json['has_shipping'] = hasShipping;
    json['unit_price'] = unitPrice;
    json['variant_id'] = variantId;
    json['variant'] = variant?.toJson() ?? {};
    json['quantity'] = quantity;
    json['fulfilled_quantity'] = fulfilledQuantity;
    json['shipped_quantity'] = shippedQuantity;
    json['refundable'] = refundable;
    json['subtotal'] = subtotal;
    json['tax_total'] = taxTotal;
    json['total'] = total;
    json['original_total'] = originalTotal;
    json['original_tax_total'] = originalTaxTotal;
    json['discount_total'] = discountTotal;
    json['gift_card_total'] = giftCardTotal;
    json['includes_tax'] = includesTax;
    json['original_item_id'] = originalItemId;
    json['order_edit_id'] = orderEditId;
    json['order_edit'] = orderEdit?.toJson() ?? {};
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata.toString();
    return json;
  }
}
