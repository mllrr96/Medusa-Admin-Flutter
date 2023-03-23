import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
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
    this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.isGiftCard,
    this.status = ProductStatus.draft,
    this.images,
    this.thumbnail,
    this.options,
    this.variants,
    this.profileId,
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
    json['status'] = status.value;
    json['discountable'] = discountable;
    if (id != null) {
      json['id'] = id;
    }
    if (title != null) {
      json['title'] = title;
    }

    if (subtitle != null) {
      json['subtitle'] = subtitle;
    }
    if (description != null) {
      json['description'] = description;
    }
    if (handle != null) {
      json['handle'] = handle;
    }
    if (isGiftCard != null) {
      json['is_giftcard'] = isGiftCard;
    }

    if (images != null) {
      json['images'] = images?.map((e) => e.toJson()).toList();
    }

    if (thumbnail != null) {
      json['thumbnail'] = thumbnail;
    }

    if (options != null) {
      json['options'] = options?.map((e) => e.toJson()).toList();
    }

    if (variants != null) {
      json['variants'] = variants?.map((e) => e.toJson()).toList();
    }

    if (profileId != null) {
      json['profile_id'] = profileId;
    }

    if (profile != null) {
      json['profile'] = profile?.toJson();
    }

    if (weight != null) {
      json['weight'] = weight;
    }

    if (height != null) {
      json['height'] = height;
    }

    if (width != null) {
      json['width'] = width;
    }

    if (length != null) {
      json['length'] = length;
    }

    if (hsCode != null) {
      json['hs_code'] = hsCode;
    }

    if (originCountry != null) {
      json['origin_country'] = originCountry;
    }

    if (midCode != null) {
      json['mid_code'] = midCode;
    }

    if (material != null) {
      json['material'] = material;
    }

    if (collectionId != null) {
      json['collection_id'] = collectionId;
    }

    if (collection != null) {
      json['collection'] = collection?.toJson();
    }

    if (typeId != null) {
      json['type_id'] = typeId;
    }

    if (type != null) {
      json['type'] = type?.toJson();
    }

    if (tags != null) {
      json['tags'] = tags?.map((e) => e.toJson()).toList();
    }

    if (externalId != null) {
      json['external_id'] = externalId;
    }

    if (salesChannels != null) {
      json['sales_channels'] = salesChannels?.map((e) => e.toJson()).toList() ?? [];
    }
    if (tags != null) {
      json['tags'] = tags?.map((e) => e.toJson()).toList();
    }

    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }

    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }
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
