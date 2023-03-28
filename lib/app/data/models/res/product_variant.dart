import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserRetrieveVariantInventoryRes {
  final ProductVariant? variant;

  UserRetrieveVariantInventoryRes(this.variant);

  factory UserRetrieveVariantInventoryRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveVariantInventoryRes(json['variant'] != null ? ProductVariant.fromJson(json['variant']) : null);
  }
}

class UserRetrieveProductVariantsRes extends PaginatedResponse {
  List<ProductVariant>? variants;

  UserRetrieveProductVariantsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['variants'] == null) return;

    variants = <ProductVariant>[];
    json['variants'].forEach((v) => variants?.add(ProductVariant.fromJson(v)));
  }
}
