import 'package:medusa_admin/app/data/models/store/index.dart';

class UserPostProductReq {
  UserPostProductReq({required this.product});

  final Product product;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['title'] = product.title;
    if (product.subtitle != null) {
      data['title'] = product.subtitle;
    }

    if (product.description != null) {
      data['description'] = product.description;
    }

    if (product.isGiftCard != null) {
      data['is_giftcard'] = product.isGiftCard;
    }

    if (product.images != null) {
      data['images'] = product.images;
    }

    if (product.thumbnail != null) {
      data['thumbnail'] = product.thumbnail;
    }

    if (product.handle != null) {
      data['handle'] = product.handle;
    }

    if (product.type != null) {
      data['type'] = product.type?.toJson();
    }

    if (product.collectionId != null) {
      data['collection_id'] = product.collectionId;
    }

    if (product.weight != null) {
      data['weight'] = product.weight;
    }

    if (product.length != null) {
      data['length'] = product.length;
    }
    if (product.height != null) {
      data['height'] = product.height;
    }

    if (product.width != null) {
      data['width'] = product.width;
    }

    if (product.hsCode != null) {
      data['hs_code'] = product.hsCode;
    }

    if (product.originCountry != null) {
      data['origin_country'] = product.originCountry;
    }

    if (product.midCode != null) {
      data['mid_code'] = product.midCode;
    }

    if (product.material != null) {
      data['material'] = product.material;
    }
    if (product.variants != null) {
      List<Map<String, dynamic>> variantsList = [];
      for (var element in product.variants!) {
        variantsList.add(element.toJson());
      }
      data['variants'] = variantsList;
    }

    if (product.options != null) {
      List<Map<String, dynamic>> optionsList = [];

      for (var element in product.options!) {
        optionsList.add({'title': element.title!});
      }
      data['options'] = optionsList;
    }

    if (product.salesChannels != null) {
      List<Map<String, dynamic>> salesChannelsList = [];
      for (var element in product.salesChannels!) {
        salesChannelsList.add(element.toJson());
      }
      data['sales_channels'] = salesChannelsList;
    }

    if (product.tags != null) {
      List<Map<String, dynamic>> tagsList = [];
      for (var element in product.tags!) {
        tagsList.add(element.toJson());
      }
      data['tags'] = tagsList;
    }
    if (product.type != null) {
      List<Map<String, dynamic>> typeList = [];
      for (var element in product.tags!) {
        typeList.add(element.toJson());
      }
      data['type'] = typeList;
    }

    data['status'] = product.status.name;
    data['discountable'] = product.discountable;

    return data;
  }
}

class UserPostUpdateProductReq {
  UserPostUpdateProductReq({
    this.title,
    this.description,
    this.subtitle,
    this.handle,
    this.thumbnail,
    this.collectionId,
    this.discountable,
    this.images,
    this.tags,
    this.type,
    this.status,
    this.salesChannels,
    this.categories,
    this.variants,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.metadata,
  });
  final String? title;
  final String? subtitle;
  final String? description;
  final String? handle;
  final ProductStatus? status;
  final List<String>? images;
  final String? thumbnail;
  final List<ProductVariant>? variants;
  final List<String>? categories;
  final num? weight;
  final num? height;
  final num? width;
  final num? length;
  final String? hsCode;
  final String? originCountry;
  final String? midCode;
  final String? material;
  final String? collectionId;
  final ProductType? type;
  final List<ProductTag>? tags;
  final bool? discountable;
  final List<SalesChannel>? salesChannels;
  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    if (title != null) {
      data['title'] = title;
    }

    if (subtitle != null) {
      data['subtitle'] = subtitle;
    }

    if (description != null) {
      data['description'] = description;
    }

    if (images != null) {
      data['images'] = images;
    }


    if (thumbnail != null) {
      if(thumbnail!.isEmpty){
        data['thumbnail'] = null;
      } else {
      data['thumbnail'] = thumbnail;
      }
    }

    if (handle != null) {
      data['handle'] = handle;
    }

    if (type != null) {
      data['type'] = type?.toJson();
    }

    if (collectionId != null) {
      data['collection_id'] = collectionId;
    }

    if (weight != null) {
      data['weight'] = weight;
    }

    if (length != null) {
      data['length'] = length;
    }
    if (height != null) {
      data['height'] = height;
    }

    if (width != null) {
      data['width'] = width;
    }

    if (hsCode != null) {
      data['hs_code'] = hsCode;
    }

    if (originCountry != null) {
      data['origin_country'] = originCountry;
    }

    if (midCode != null) {
      data['mid_code'] = midCode;
    }

    if (material != null) {
      data['material'] = material;
    }
    if (variants != null) {
      List<Map<String, dynamic>> variantsList = [];
      for (var element in variants!) {
        variantsList.add(element.toJson());
      }
      data['variants'] = variantsList;
    }

    if (salesChannels != null) {
      List<Map<String, dynamic>> salesChannelsList = [];
      for (var element in salesChannels!) {
        salesChannelsList.add(element.toJson());
      }
      data['sales_channels'] = salesChannelsList;
    }

    if (tags != null) {
      print('HER');
      List<Map<String, dynamic>> tagsList = [];
      for (var element in tags!) {
        tagsList.add(element.toJson(excludeDates: true));
      }
      data['tags'] = tagsList;
    }
    if (type != null) {
      List<Map<String, dynamic>> typeList = [];
      for (var element in tags!) {
        typeList.add(element.toJson());
      }
      data['type'] = typeList;
    }

    if (status != null) {
      data['status'] = status!.name;
    }

    if (discountable != null) {
      data['discountable'] = discountable;
    }

    return data;
  }
}
