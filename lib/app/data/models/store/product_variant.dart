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
    if (json['prices'] != null) {
      prices = <MoneyAmount>[];
      json['prices'].forEach((v) {
        prices!.add(MoneyAmount.fromJson(v));
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
        options!.add(ProductOptionValue.fromJson(v));
      });
    }
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    data['title'] = title;
    if (productId != null) {
      data['product_id'] = productId;
    }
    if (product != null) {
      data['product'] = product?.toJson() ?? {};
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    data['sku'] = sku;
    data['barcode'] = barcode;
    data['ean'] = ean;
    data['upc'] = upc;
    if (variantRank != null) {
      data['variant_rank'] = variantRank;
    }
    data['inventory_quantity'] = inventoryQuantity;
    data['allow_backorder'] = allowBackorder;
    data['manage_inventory'] = manageInventory;
    data['hs_code'] = hsCode;
    data['origin_country'] = originCountry;
    data['mid_code'] = midCode;
    data['material'] = material;
    data['weight'] = weight;
    data['length'] = length;
    data['height'] = height;
    data['width'] = width;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata;
    }
    return data;
  }
}
