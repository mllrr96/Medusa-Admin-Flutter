import 'index.dart';

class ShippingMethod {
  String? id;
  String? shippingOptionId;
  ShippingOption? shippingOption;
  String? orderId;
  Order? order;
  String? returnId;
  Return? returnOrder;
  String? swapId;
  Swap? swap;
  String? cartId;
  Cart? cart;
  String? claimOrderId;
  ClaimOrder? claimOrder;
  List<ShippingMethodTaxLine>? taxLines;
  int? price;
  Map<String, dynamic>? data;
  bool? includesTax;

  ShippingMethod({
    this.id,
    required this.shippingOptionId,
    this.shippingOption,
    this.orderId,
    this.order,
    this.returnId,
    this.returnOrder,
    this.swapId,
    this.swap,
    this.cartId,
    this.cart,
    this.claimOrderId,
    this.claimOrder,
    this.taxLines,
    required this.price,
    this.data,
    this.includesTax,
  });

  ShippingMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingOptionId = json['shipping_option_id'];
    shippingOption = json['shipping_option'] != null
        ? ShippingOption.fromJson(json['shipping_option'])
        : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    returnId = json['return_id'];
    returnOrder = json['return_order'] != null
        ? Return.fromJson(json['return_order'])
        : null;
    swapId = json['swap_id'];
    swap = json['swap'] != null ? Swap.fromJson(json['swap']) : null;
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    claimOrderId = json['claim_order_id'];
    claimOrder = json['claim_order'] != null
        ? ClaimOrder.fromJson(json['claim_order'])
        : null;
    if (json['tax_lines'] != null) {
      taxLines = <ShippingMethodTaxLine>[];
      json['tax_lines']
          .forEach((e) => taxLines!.add(ShippingMethodTaxLine.fromJson(e)));
    }
    price = json['price'];
    data = json['data'];
    includesTax = json['includes_tax'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (shippingOptionId != null) {
      json['option_id'] = shippingOptionId;
    }
    if (shippingOption != null) {
      json['shipping_option'] = shippingOption?.toJson();
    }
    if (orderId != null) {
      json['order_id'] = orderId;
    }
    if (order != null) {
      json['order'] = order?.toJson();
    }
    if (returnId != null) {
      json['return_id'] = returnId;
    }
    if (returnOrder != null) {
      json['return_order'] = returnOrder?.toJson();
    }
    if (swapId != null) {
      json['swap_id'] = swapId;
    }
    if (swap != null) {
      json['swap'] = swap?.toJson();
    }
    if (cartId != null) {
      json['cart_id'] = cartId;
    }
    if (cart != null) {
      json['cart'] = cart?.toJson();
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
    if (price != null) {
      json['price'] = price;
    }
    if (data != null) {
      json['data'] = data;
    }
    if (includesTax != null) {
      json['includes_tax'] = includesTax;
    }
    print(json);
    return json;
  }
}
