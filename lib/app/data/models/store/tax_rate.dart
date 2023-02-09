

import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/models/store/product_type.dart';
import 'package:medusa_admin/app/data/models/store/region.dart';
import 'package:medusa_admin/app/data/models/store/shipping_option.dart';

class TaxRate {
  String? id;
  int? rate;
  String? code;
  String? name;
  String? regionId;
  Region? region;
  Map<String, dynamic>? metadata;
  List<Product>? products;
  List<ProductType>? productTypes;
  List<ShippingOption>? shippingOptions;
  int? productCount;
  int? productTypeCount;
  int? shippingOptionCount;

  TaxRate({
    this.id,
    this.rate,
    this.code,
    this.name,
    this.regionId,
    this.region,
    this.metadata,
    this.products,
    this.productTypes,
    this.shippingOptions,
    this.productCount,
    this.productTypeCount,
    this.shippingOptionCount,
  });

  TaxRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    code = json['code'];
    name = json['name'];
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    metadata = json['metadata'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
    if (json['product_types'] != null) {
      productTypes = <ProductType>[];
      json['product_types'].forEach((v) {
        productTypes!.add(new ProductType.fromJson(v));
      });
    }
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['shipping_options'].forEach((v) {
        shippingOptions!.add(new ShippingOption.fromJson(v));
      });
    }
    productCount = json['product_count'];
    productTypeCount = json['product_type_count'];
    shippingOptionCount = json['shipping_option_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['code'] = this.code;
    data['name'] = this.name;
    data['region_id'] = this.regionId;
    data['region'] = region?.toJson() ?? {};
    data['metadata'] = this.metadata;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.productTypes != null) {
      data['product_types'] =
          this.productTypes!.map((v) => v.toJson()).toList();
    }
    if (this.shippingOptions != null) {
      data['shipping_options'] =
          this.shippingOptions!.map((v) => v.toJson()).toList();
    }
    data['product_count'] = this.productCount;
    data['product_type_count'] = this.productTypeCount;
    data['shipping_option_count'] = this.shippingOptionCount;
    return data;
  }
}
