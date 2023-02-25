import 'package:medusa_admin/app/data/models/store/index.dart';

import 'common.dart';

class UserCollectionsRes extends PaginatedResponse {
  List<ProductCollection>? collections;

  UserCollectionsRes.fromJson(json) : super.fromJson(json) {
    if (json['collections'] != null) {
      collections = <ProductCollection>[];
      json['collections'].forEach((v) {
        collections?.add(ProductCollection.fromJson(v));
      });
    }
  }
}

class UserCollectionRes {
  ProductCollection? collection;

  UserCollectionRes.fromJson(json) {
    if (json['collection'] != null) {
      collection = ProductCollection.fromJson(json['collection']);
    }
  }
}

class UserCreateCollectionRes {
  ProductCollection? collection;
  UserCreateCollectionRes.fromJson(json) {
    if (json['collection'] != null) {
      collection = ProductCollection.fromJson(json['collection']);
    }
  }
}

class UserCollectionUpdateProductsRes {
  ProductCollection? collection;
  UserCollectionUpdateProductsRes.fromJson(json) {
    if (json['collection'] != null) {
      collection = ProductCollection.fromJson(json['collection']);
    }
  }
}

class UserCollectionRemoveProductsRes {
  /// The ID of the collection
  String? id;

  /// The type of object the removal was executed on
  ///
  /// Default: "product-collection"
  String? object;

  /// The IDs of the products removed from the collection
  List<String>? removedProducts;

  UserCollectionRemoveProductsRes.fromJson(json) {
    id = json['id'];
    object = json['object'];
    removedProducts = List<String>.from(json['removed_products']);
  }
}
