import 'package:medusa_admin/core/utils/enums.dart';

class UserCreateConditionReq {
  /// Operator of the condition
  final DiscountConditionOperator operator;

  /// list of product IDs if the condition is applied on products.
  final List<String>? productIds;

  /// list of product type IDs if the condition is applied on product types.
  final List<String>? productTypeIds;

  /// list of product collection IDs if the condition is applied on product collections.
  final List<String>? productCollectionIds;

  /// list of product tag IDs if the condition is applied on product tags.
  final List<String>? productTagsIds;

  /// list of customer group IDs if the condition is applied on customer groups.
  final List<String>? customerGroupIds;

  UserCreateConditionReq({
    required this.operator,
    this.customerGroupIds,
    this.productTypeIds,
    this.productIds,
    this.productCollectionIds,
    this.productTagsIds,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['operator'] = operator.value;

    if (productIds != null) {
      json['products'] = productIds;
    }

    if (customerGroupIds != null) {
      json['customer_groups'] = customerGroupIds;
    }

    if (productTypeIds != null) {
      json['product_types'] = productTypeIds;
    }

    if (productTagsIds != null) {
      json['product_tags'] = productTagsIds;
    }

    if (productCollectionIds != null) {
      json['product_collections'] = productCollectionIds;
    }

    return json;
  }
}
