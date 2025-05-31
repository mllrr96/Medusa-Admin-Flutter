/// AdminProductCategoryResponse
/// {
///     "properties": {
///         "product_category": {
///             "$ref": "#/components/schemas/AdminProductCategory"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_category"
///     ],
///     "description": "The product category's details."
/// }
library;

import 'exports.dart';
part 'admin_product_category_response.freezed.dart';
part 'admin_product_category_response.g.dart'; // AdminProductCategoryResponse

@freezed
abstract class AdminProductCategoryResponse
    with _$AdminProductCategoryResponse {
  const AdminProductCategoryResponse._();

  @jsonSerializable
  const factory AdminProductCategoryResponse({
    /// productCategory
    @JsonKey(name: AdminProductCategoryResponse.productCategoryKey)
    required AdminProductCategory productCategory,
  }) = _AdminProductCategoryResponse;

  factory AdminProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductCategoryResponseFromJson(json);

  static const String productCategoryKey = r'product_category';
}
