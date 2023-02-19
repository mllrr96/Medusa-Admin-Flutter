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
