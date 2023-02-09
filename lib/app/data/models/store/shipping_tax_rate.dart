import 'index.dart';


class ShippingTaxRate {
  String? shippingOptionId;
  ShippingOption? shippingOption;
  String? rateId;
  TaxRate? taxRate;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ShippingTaxRate({
    required this.shippingOptionId,
    this.shippingOption,
    required this.rateId,
    this.taxRate,
    this.createdAt,
    this.updatedAt,
    this.metadata = const <String, dynamic>{},
  });

  ShippingTaxRate.fromJson(Map<String, dynamic> json) {
    shippingOptionId = json['shipping_option_id'];
    shippingOption = json['shipping_option'] != null
        ? ShippingOption.fromJson(json['shipping_option'])
        : null;
    rateId = json['rate_id'];
    taxRate =
        json['tax_rate'] != null ? TaxRate.fromJson(json['tax_rate']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['shipping_option_id'] = shippingOptionId;
    json['shipping_option'] = shippingOption?.toJson();
    json['rate_id'] = rateId;
    json['tax_rate'] = taxRate?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
