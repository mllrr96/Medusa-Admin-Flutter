import 'package:medusa_admin/app/data/models/store/index.dart';

import 'common.dart';

class UserRetrieveProductTypesRes extends PaginatedResponse {
  List<ProductType>? productTypes;

  UserRetrieveProductTypesRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['product_types'] == null) return;

    productTypes = <ProductType>[];
    json['product_types'].forEach((v) {
      productTypes?.add(ProductType.fromJson(v));
    });
  }
}
