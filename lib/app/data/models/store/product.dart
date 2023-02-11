import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'index.dart';
part 'product.g.dart';

@CopyWith()
class Product extends Equatable {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? handle;
  final bool? isGiftCard;
  final ProductStatus status;
  final List<ImageData>? images;
  final String? thumbnail;
  final List<ProductOption>? options;
  final List<ProductVariant>? variants;
  final String? profileId;
  final ShippingProfile? profile;
  final num? weight;
  final num? height;
  final num? width;
  final num? length;
  final String? hsCode;
  final String? originCountry;
  final String? midCode;
  final String? material;
  final String? collectionId;
  final ProductCollection? collection;
  final String? typeId;
  final ProductType? type;
  final List<ProductTag>? tags;
  final bool discountable;
  final String? externalId;
  final List<SalesChannel>? salesChannels;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  const Product({
    this.id,
    required this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.isGiftCard,
    required this.status,
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
    required this.discountable,
    this.externalId,
    this.salesChannels,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<SalesChannel>? salesChannelsNew;
    if (json['sales_channels'] != null) {
      salesChannelsNew = [];
      json['sales_channels'].forEach((e) => salesChannelsNew!.add(SalesChannel.fromJson(e)));
    }
    List<ProductTag>? tags;
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((e) => tags!.add(ProductTag.fromJson(e)));
    }
    List<ImageData>? images;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((e) => images!.add(ImageData.fromJson(e)));
    }

    List<ProductOption>? options;

    if (json['options'] != null) {
      options = [];
      json['options'].forEach((e) => options!.add(ProductOption.fromJson(e)));
    }
    List<ProductVariant>? variants;

    if (json['variants'] != null) {
      variants = [];
      json['variants'].forEach((e) => variants!.add(ProductVariant.fromJson(e)));
    }

    return Product(
      variants: variants,
      images: images,
      options: options,
      id: json['id'],
      thumbnail: json['thumbnail'],
      tags: tags,
      isGiftCard: json['is_giftcard'],
      subtitle: json['subtitle'],
      description: json['description'],
      type: json['type'] != null ? ProductType.fromJson(json['type'] ?? {}) : null,
      profile: json['profile'] != null ? ShippingProfile.fromJson(json['profile']) : null,
      profileId: json['profile_id'],
      collectionId: json['collection_id'],
      collection: json['collection'] != null ? ProductCollection.fromJson(json['collection'] ?? {}) : null,
      width: json['width'],
      length: json['length'],
      height: json['height'],
      weight: json['weight'],
      material: json['material'],
      typeId: json['type_id'],
      originCountry: json['origin_country'],
      hsCode: json['hs_code'],
      midCode: json['mid_code'],
      externalId: json['external_id'],
      metadata: json['metadata'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      salesChannels: salesChannelsNew,
      title: json['title'],
      handle: json['handle'],
      status: ProductStatus.values.firstWhere((e) => e.value == json['status'], orElse: () => ProductStatus.draft),
      discountable: json['discountable'] ?? false,
    );
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
    json['sales_channels'] = salesChannels?.map((e) => e.toJson()).toList() ?? [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        metadata,
        deletedAt,
        updatedAt,
        createdAt,
        salesChannels,
        handle,
        externalId,
        id,
        discountable,
        tags,
        type,
        typeId,
        collection,
        collectionId,
        material,
        midCode,
        originCountry,
        hsCode,
        length,
        width,
        height,
        weight,
        profileId,
        profile,
        variants,
        options,
        thumbnail,
        images,
        status,
        description,
      ];
}

enum ProductStatus {
  draft('draft'),
  proposed('proposed'),
  published('published'),
  rejected('rejected');

  final String value;

  const ProductStatus(this.value);
}
