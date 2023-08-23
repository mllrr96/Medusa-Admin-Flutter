import 'index.dart';

class ProductTypeTaxRate {
  String? productTypeId;
  ProductType? productType;
  String? rateId;
  TaxRate? taxRate;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ProductTypeTaxRate({
    this.productTypeId,
    this.productType,
    this.rateId,
    this.taxRate,
    this.createdAt,
    this.updatedAt,
    this.metadata = const <String, dynamic>{},
  });

  ProductTypeTaxRate.fromJson(Map<String, dynamic> json) {
    productTypeId = json['product_type_id'];
    productType = json['product_type'] != null
        ? ProductType.fromJson(json['product_type'])
        : null;
    rateId = json['rate_id'];
    taxRate =
        json['tax_rate'] != null ? TaxRate.fromJson(json['tax_rate']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['product_type_id'] = productTypeId;
    json['product_type'] = productType?.toJson() ?? {};
    json['rate_id'] = rateId;
    json['tax_rate'] = taxRate?.toJson() ?? {};
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
