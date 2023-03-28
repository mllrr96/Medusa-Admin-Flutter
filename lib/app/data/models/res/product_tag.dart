import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/product_tag.dart';

class UserRetrieveTagsUsageNumberRes {
  final List<ProductTag> tags;
  UserRetrieveTagsUsageNumberRes(this.tags);

  factory UserRetrieveTagsUsageNumberRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveTagsUsageNumberRes(
        json['tags'] != null ? json['tags']!.map((v) => ProductTag.fromJson(v)).toList() : null);
  }
}

class UserRetrieveProductTagsRes extends PaginatedResponse {
  List<ProductTag>? tags;

  UserRetrieveProductTagsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['product_tags'] != null) {
      tags = json['product_tags']!.map((v) => ProductTag.fromJson(v)).toList();
    }
  }
}
