import 'package:medusa_admin/core/extension/product_variant_extension.dart';
import 'package:medusa_admin/data/models/wrapped.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

extension CopyWithProduct on Product {
  Product copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    String? handle,
    bool? isGiftCard,
    ProductStatus? status,
    List<ImageData>? images,
    Wrapped<String?>? thumbnail,
    List<ProductOption>? options,
    List<ProductVariant>? variants,
    String? profileId,
    ShippingProfile? profile,
    num? weight,
    num? height,
    num? width,
    num? length,
    String? hsCode,
    Wrapped<String?>? originCountry,
    String? midCode,
    String? material,
    String? collectionId,
    ProductCollection? collection,
    String? typeId,
    ProductType? type,
    List<ProductTag>? tags,
    bool? discountable,
    String? externalId,
    List<SalesChannel>? salesChannels,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    Map<String, dynamic>? metadata,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      handle: handle ?? this.handle,
      isGiftCard: isGiftCard ?? this.isGiftCard,
      status: status ?? this.status,
      images: images ?? this.images,
      thumbnail: thumbnail != null ? thumbnail.value : this.thumbnail,
      options: options ?? this.options,
      variants: variants ?? this.variants,
      profileId: profileId ?? this.profileId,
      profile: profile ?? this.profile,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      width: width ?? this.width,
      length: length ?? this.length,
      hsCode: hsCode ?? this.hsCode,
      originCountry:
          originCountry != null ? originCountry.value : this.originCountry,
      midCode: midCode ?? this.midCode,
      material: material ?? this.material,
      collectionId: collectionId ?? this.collectionId,
      collection: collection ?? this.collection,
      typeId: typeId ?? this.typeId,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      discountable: discountable ?? this.discountable,
      externalId: externalId ?? this.externalId,
      salesChannels: salesChannels ?? this.salesChannels,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  Product duplicate({
    String? title,
    String? subtitle,
    String? description,
    String? handle,
    bool? isGiftCard,
    ProductStatus? status,
    List<ImageData>? images,
    Wrapped<String?>? thumbnail,
    List<ProductOption>? options,
    List<ProductVariant>? variants,
    num? weight,
    num? height,
    num? width,
    num? length,
    String? hsCode,
    Wrapped<String?>? originCountry,
    String? midCode,
    String? material,
    String? collectionId,
    ProductType? type,
    List<ProductTag>? tags,
    bool? discountable,
    List<SalesChannel>? salesChannels,
    Map<String, dynamic>? metadata,
  }) {
    return Product(
      id: null,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      isGiftCard: isGiftCard ?? this.isGiftCard,
      discountable: discountable ?? this.discountable,
      images: images?.map((e) => ImageData(url: e.url)).toList() ??
          this.images?.map((e) => ImageData(url: e.url)).toList(),
      thumbnail: thumbnail != null ? thumbnail.value : this.thumbnail,
      handle: handle ?? this.handle,
      status: ProductStatus.draft,
      collectionId: collectionId ?? this.collectionId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      width: width ?? this.width,
      length: length ?? this.length,
      hsCode: hsCode ?? this.hsCode,
      originCountry:
          originCountry != null ? originCountry.value : this.originCountry,
      midCode: midCode ?? this.midCode,
      material: material ?? this.material,
      metadata: metadata ?? this.metadata,
      //
      type: type != null
          ? ProductType(value: type.value, id: type.id)
          : this.type != null
              ? ProductType(value: this.type!.value, id: this.type!.id)
              : null,
      tags: tags?.map((e) => ProductTag(value: e.value, id: e.id)).toList() ??
          this.tags?.map((e) => ProductTag(value: e.value, id: e.id)).toList(),

      salesChannels: salesChannels
              ?.map((e) => SalesChannel(name: null, id: e.id))
              .toList() ??
          this
              .salesChannels
              ?.map((e) => SalesChannel(name: null, id: e.id))
              .toList(),
      options: options
              ?.map((e) => ProductOption(title: e.title, productId: null))
              .toList() ??
          this
              .options
              ?.map((e) => ProductOption(title: e.title, productId: null))
              .toList(),
      variants: variants?.map((e) => e.duplicate()).toList() ??
          this.variants?.map((e) => e.duplicate()).toList(),
      //
      profileId: null,
      profile: null,
      collection: null,
      typeId: null,
      externalId: null,
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
    );
  }
}
