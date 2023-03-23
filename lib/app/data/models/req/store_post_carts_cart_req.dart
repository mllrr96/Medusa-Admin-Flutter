import 'package:medusa_admin/app/data/models/store/index.dart';


class StorePostCartsCartReq {
  String? regionId;
  String? countryCode;
  String? email;
  String? billingAddress;
  String? shippingAddress;
  List<GiftCard>? giftCards;
  List<Discount>? discounts;
  String? customerId;
  dynamic context;
  String? salesChannelId;

  StorePostCartsCartReq({
    this.regionId,
    this.countryCode,
    this.email,
    this.billingAddress,
    this.shippingAddress,
    this.giftCards,
    this.discounts,
    this.customerId,
    this.context,
    this.salesChannelId,
  });

  StorePostCartsCartReq.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    countryCode = json['country_code'];
    email = json['email'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    if (json['gift_cards'] != null) {
      giftCards = <GiftCard>[];
      json['gift_cards'].forEach((v) {
        giftCards!.add(GiftCard.fromJson(v));
      });
    }
    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts'].forEach((v) {
        discounts!.add(Discount.fromJson(v));
      });
    }
    customerId = json['customer_id'];
    context = json['context'];
    salesChannelId = json['sales_channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region_id'] = regionId;
    data['country_code'] = countryCode;
    data['email'] = email;
    data['billing_address'] = billingAddress;
    data['shipping_address'] = shippingAddress;
    if (giftCards != null) {
      data['gift_cards'] = giftCards!.map((v) => v.toJson()).toList();
    }
    if (discounts != null) {
      data['discounts'] = discounts!.map((v) => v.toJson()).toList();
    }
    data['customer_id'] = customerId;
    data['context'] = context;
    data['sales_channel_id'] = salesChannelId;
    return data;
  }
}
