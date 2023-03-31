import 'index.dart';


class ShippingMethodTaxLine {
  String? id;
  String? shippingMethodId;
  ShippingMethod? shippingMethod;
  String? code;
  String? name;
  num? rate;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  ShippingMethodTaxLine({
    this.id,
    required this.shippingMethodId,
    this.shippingMethod,
    this.code,
    required this.name,
    required this.rate,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  ShippingMethodTaxLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingMethodId = json['shipping_method_id'];
    shippingMethod = json['shipping_method'] != null
        ? ShippingMethod.fromJson(json['shipping_method'])
        : null;
    code = json['code'];
    name = json['name'];
    rate = json['rate'];
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    metadata = json['metadata'] ;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['shipping_method_id'] = shippingMethodId;
    json['shipping_method'] = shippingMethod?.toJson();
    json['code'] = code;
    json['name'] = name;
    json['rate'] = rate;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
