import 'index.dart';


class ProductVariant {
  String? id;
  String? title;
  String? productId;
  Product? product;
  List<MoneyAmount>? prices;
  String? sku;
  String? barcode;
  String? ean;
  String? upc;
  int? variantRank;
  int? inventoryQuantity;
  bool? allowBackorder;
  bool? manageInventory;
  String? hsCode;
  String? originCountry;
  String? midCode;
  String? material;
  int? weight;
  int? length;
  int? height;
  int? width;
  List<ProductOptionValue>? options;
  Map<String, dynamic>? metadata;

  ProductVariant({
    this.id,
    this.title,
    this.productId,
    this.product,
    this.prices,
    this.sku,
    this.barcode,
    this.ean,
    this.upc,
    this.variantRank,
    this.inventoryQuantity,
    this.allowBackorder,
    this.manageInventory,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.weight,
    this.length,
    this.height,
    this.width,
    this.options,
    this.metadata,
  });

  ProductVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productId = json['product_id'];
    product = json['product'] != null ? Product.fromJson(json) : null;
    ;
    if (json['prices'] != null) {
      prices = <MoneyAmount>[];
      json['prices'].forEach((v) {
        prices!.add(new MoneyAmount.fromJson(v));
      });
    }
    sku = json['sku'];
    barcode = json['barcode'];
    ean = json['ean'];
    upc = json['upc'];
    variantRank = json['variant_rank'];
    inventoryQuantity = json['inventory_quantity'];
    allowBackorder = json['allow_backorder'];
    manageInventory = json['manage_inventory'];
    hsCode = json['hs_code'];
    originCountry = json['origin_country'];
    midCode = json['mid_code'];
    material = json['material'];
    weight = json['weight'];
    length = json['length'];
    height = json['height'];
    width = json['width'];
    if (json['options'] != null) {
      options = <ProductOptionValue>[];
      json['options'].forEach((v) {
        options!.add(new ProductOptionValue.fromJson(v));
      });
    }
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['product_id'] = this.productId;
    data['product'] = product?.toJson() ?? {};
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['ean'] = this.ean;
    data['upc'] = this.upc;
    data['variant_rank'] = this.variantRank;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['allow_backorder'] = this.allowBackorder;
    data['manage_inventory'] = this.manageInventory;
    data['hs_code'] = this.hsCode;
    data['origin_country'] = this.originCountry;
    data['mid_code'] = this.midCode;
    data['material'] = this.material;
    data['weight'] = this.weight;
    data['length'] = this.length;
    data['height'] = this.height;
    data['width'] = this.width;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['metadata'] = this.metadata;
    return data;
  }
}
