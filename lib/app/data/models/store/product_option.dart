import 'index.dart';

class ProductOption {
  String? id;
  String? title;
  List<ProductOptionValue>? values;
  String? productId;
  Product? product;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ProductOption({
    this.id,
     this.title,
    this.values,
     this.productId,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  ProductOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['values'] != null) {
      values = <ProductOptionValue>[];
      json['values']
          .forEach((e) => values!.add(ProductOptionValue.fromJson(e)));
    }
    productId = json['product_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['values'] = values?.map((e) => e.toJson()).toList() ?? [];
    json['product_id'] = productId;
    json['product'] = product?.toJson() ?? {};
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;

    return json;
  }
}
