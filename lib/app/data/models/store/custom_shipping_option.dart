
import 'package:medusa_admin/app/data/models/store/shipping_option.dart';

import 'cart.dart';

class CustomShippingOption {
  String? id;
  int? price;
  String? shippingOptionId;
  ShippingOption? shippingOption;
  String? cartId;
  Cart? cart;
  bool? includeTax;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  CustomShippingOption({
    this.id,
    required this.price,
    required this.shippingOptionId,
    this.shippingOption,
    this.cartId,
    this.cart,
    this.includeTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  CustomShippingOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    shippingOptionId = json['shipping_option_id'];
    shippingOption = json['shipping_option'] != null
        ? ShippingOption.fromJson(json['shipping_option'])
        : null;
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    includeTax = json['includes_tax'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['price'] = price;
    json['shipping_option_id'] = shippingOptionId;
    json['shipping_option'] = shippingOption?.toJson() ?? {};
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson() ?? {};
    json['include_tax'] = includeTax;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
