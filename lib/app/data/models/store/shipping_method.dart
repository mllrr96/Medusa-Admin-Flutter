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
    json['id'] = id;
    json['shipping_option_id'] = shippingOptionId;
    json['shipping_option'] = shippingOption?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['return_id'] = returnId;
    json['return_order'] = returnOrder?.toJson();
    json['swap_id'] = swap;
    json['swap'] = swap?.toJson();
    json['cart_id'] = cart;
    json['cart'] = cart?.toJson();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['tax_lines'] = taxLines?.map((e) => e.toJson()).toList() ?? [];
    json['price'] = price;
    json['data'] = data;
    json['includes_tax'] = includesTax;
    return json;
  }
}
