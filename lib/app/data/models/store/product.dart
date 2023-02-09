import 'index.dart';

class Product {
  String? id;
  String? title;
  String? subtitle;
  String? description;
  String? handle;
  bool? isGiftCard = false;
  ProductStatus status = ProductStatus.draft;
  List<ImageData>? images;
  String? thumbnail;
  List<ProductOption>? options;
  List<ProductVariant>? variants;
  String? profileId;
  ShippingProfile? profile;
  num? weight;
  num? height;
  num? width;
  num? length;
  String? hsCode;
  String? originCountry;
  String? midCode;
  String? material;
  String? collectionId;
  ProductCollection? collection;
  String? typeId;
  ProductType? type;
  List<ProductTag>? tags;
  bool discountable = true;
  String? externalId;
  List<SalesChannel>? salesChannels;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Product({
    this.id,
    required this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.isGiftCard = false,
    this.status = ProductStatus.draft,
    this.images,
    this.thumbnail,
    this.options,
    this.variants,
    required this.profileId,
    this.profile,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.collectionId,
    this.collection,
    this.typeId,
    this.type,
    this.tags,
    this.discountable = true,
    this.externalId,
    this.salesChannels,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    handle = json['handle'];
    isGiftCard = json['is_giftcard'];
    status = ProductStatus.values.firstWhere((e) => e.value == json['status'],
        orElse: () => ProductStatus.draft);
    if (json['images'] != null) {
      images = <ImageData>[];
      json['images'].forEach((e) => images!.add(ImageData.fromJson(e)));
    }
    thumbnail = json['thumbnail'];
    if (json['options'] != null) {
      options = <ProductOption>[];
      json['options'].forEach((e) => options!.add(ProductOption.fromJson(e)));
    }
    if (json['variants'] != null) {
      variants = <ProductVariant>[];
      json['variants']
          .forEach((e) => variants!.add(ProductVariant.fromJson(e)));
    }
    profileId = json['profile_id'];
    profile = json['profile'] != null
        ? ShippingProfile.fromJson(json['profile'])
        : null;
    weight = json['weight'] ?? 0;
    height = json['height'] ?? 0;
    width = json['width'] ?? 0;
    length = json['length'] ?? 0;
    hsCode = json['hs_code'];
    originCountry = json['origin_country'];
    midCode = json['mid_code'];
    material = json['material'];
    collectionId = json['collection_id'];
    collection = json['collection'] != null
        ? ProductCollection.fromJson(json['collection'] ?? {})
        : null;
    typeId = json['type_id'];
    type =
        json['type'] != null ? ProductType.fromJson(json['type'] ?? {}) : null;
    if (json['tags'] != null) {
      tags = <ProductTag>[];
      json['tags'].forEach((e) => tags!.add(ProductTag.fromJson(e)));
    }
    discountable = json['discountable'] ?? true;
    externalId = json['external_id'];
    if (json['sales_channels'] != null) {
      salesChannels = <SalesChannel>[];
      json['sales_channels']
          .forEach((e) => salesChannels!.add(SalesChannel.fromJson(e)));
    }
    // createdAt = DateTime.tryParse(json['created_at'] ?? '');
    // updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    // deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['subtitle'] = subtitle;
    json['description'] = description;
    json['handle'] = handle;
    json['is_giftcard'] = isGiftCard;
    json['status'] = status.value;
    json['images'] = images?.map((e) => e.toJson()).toList() ?? [];
    json['thumbnail'] = thumbnail;
    json['options'] = options?.map((e) => e.toJson()).toList() ?? [];
    json['variants'] = variants?.map((e) => e.toJson()).toList() ?? [];
    json['profile_id'] = profileId;
    json['profile'] = profile?.toJson() ?? {};
    json['weight'] = weight ?? 0;
    json['height'] = height ?? 0;
    json['width'] = width ?? 0;
    json['length'] = length ?? 0;
    json['hs_code'] = hsCode;
    json['origin_country'] = originCountry;
    json['mid_code'] = midCode;
    json['material'] = material;
    json['collection_id'] = collectionId;
    json['collection'] = collection?.toJson() ?? {};
    json['type_id'] = typeId;
    json['type'] = type?.toJson() ?? {};
    json['tags'] = tags?.map((e) => e.toJson()).toList() ?? [];
    json['discountable'] = discountable;
    json['external_id'] = externalId;
    json['sales_channels'] =
        salesChannels?.map((e) => e.toJson()).toList() ?? [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ProductStatus {
  draft('draft'),
  proposed('proposed'),
  published('published'),
  rejected('rejected');

  final String value;

  const ProductStatus(this.value);
}
