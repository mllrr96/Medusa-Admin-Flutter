import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'index.dart';
part 'product.g.dart';

@CopyWith()
class Product extends Equatable {
  // The product's id
  final String? id;

  // A title that can be displayed for easy identification of the product.
  final String? title;

  // An optional subtitle that can be used to further specify the product.
  final String? subtitle;

  // A short description of the product.
  final String? description;

  // A unique identifier for the product (e.g. for slug structure).
  final String? handle;

  // Whether the product represents a gift card. products that represent gift cards will automatically generate a redeemable gift card code once they are purchased.
  final bool? isGiftCard;

  // The status of the product
  final ProductStatus status;

  // The details of the product's images.
  final List<ImageData>? images;

  // A url to an image file that can be used to identify the product.
  final String? thumbnail;

  // The details of the product options that are defined for the product. the product's variants will have a unique combination of values of the product's options.
  final List<ProductOption>? options;

  // The details of the product variants that belong to the product. each will have a unique combination of values of the product's options.
  final List<ProductVariant>? variants;

  // The id of the shipping profile that the product belongs to. the shipping profile has a set of defined shipping options that can be used to fulfill the product.
  final String? profileId;

  // The details of the shipping profile that the product belongs to. the shipping profile has a set of defined shipping options that can be used to fulfill the product.
  final ShippingProfile? profile;

  // The weight of the product variant. may be used in shipping rate calculations.
  final num? weight;

  // The height of the product variant. may be used in shipping rate calculations.
  final num? height;

  // The width of the product variant. may be used in shipping rate calculations.
  final num? width;

  // The length of the product variant. may be used in shipping rate calculations.
  final num? length;

  // The harmonized system code of the product variant. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? hsCode;

  // The country in which the product variant was produced. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? originCountry;

  // The manufacturers identification code that identifies the manufacturer of the product variant. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? midCode;

  // The material and composition that the product variant is made of, may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? material;

  // The id of the product collection that the product belongs to.
  final String? collectionId;

  // The details of the product collection that the product belongs to.
  final ProductCollection? collection;

  // The id of the product type that the product belongs to.
  final String? typeId;

  // The details of the product type that the product belongs to.
  final ProductType? type;

  // The details of the product tags used in this product.
  final List<ProductTag>? tags;

  // Whether the product can be discounted. discounts will not apply to line items of this product when this flag is set to false.
  final bool discountable;

  // The external id of the product
  final String? externalId;

  // The details of the sales channels this product is available in.
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
      type: json['type'] != null ? ProductType.fromJson(json['type']) : null,
      profile: json['profile'] != null ? ShippingProfile.fromJson(json['profile']) : null,
      profileId: json['profile_id'],
      collectionId: json['collection_id'],
      collection: json['collection'] != null ? ProductCollection.fromJson(json['collection']) : null,
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
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
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
