import 'index.dart';


class ProductTaxRate {
  String? productId;
  Product? product;
  String? rateId;
  TaxRate? taxRate;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = {};

  ProductTaxRate({
    required this.productId,
    this.product,
    required this.rateId,
    this.taxRate,
    this.createdAt,
    this.updatedAt,
    this.metadata = const <String, dynamic>{},
  });

  ProductTaxRate.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    product = json['product'] != null
        ? Product.fromJson(json['product'])
        : null;
    rateId = json['rate_id'];
    taxRate =
        json['tax_rate'] != null ? TaxRate.fromJson(json['tax_rate']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['product_id'] = productId;
    json['product'] = product?.toJson();
    json['rate_id'] = rateId;
    json['tax_rate'] = taxRate?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    return json;
  }
}
