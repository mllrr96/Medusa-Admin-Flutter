import 'index.dart';


class ShippingProfile {
  String? id;
  String? name;
  ShippingProfileType type = ShippingProfileType.defaultType;
  List<Product>? products;
  List<ShippingOption>? shippingOptions;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ShippingProfile({
    this.id,
    required this.name,
    required this.type,
    this.products,
    this.shippingOptions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  ShippingProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = ShippingProfileType.values.firstWhere(
        (e) => e.value == (json['type'] ?? ''),
        orElse: () => ShippingProfileType.defaultType);
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((e) => products!.add(Product.fromJson(e)));
    }
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['shipping_options']
          .forEach((e) => shippingOptions!.add(ShippingOption.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['type'] = type.value;
    json['products'] = products?.map((e) => e.toJson()).toList() ?? [];
    json['shipping_options'] =
        shippingOptions?.map((e) => e.toJson()).toList() ?? [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ShippingProfileType {
  defaultType('default'),
  custom('custom'),
  giftCard('gift_card');

  final String value;

  const ShippingProfileType(this.value);
}
