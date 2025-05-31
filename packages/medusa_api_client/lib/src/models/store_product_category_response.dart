/// StoreProductCategoryResponse
/// {
///     "properties": {
///         "product_category": {
///             "$ref": "#/components/schemas/StoreProductCategory"
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
part 'store_product_category_response.freezed.dart';
part 'store_product_category_response.g.dart'; // StoreProductCategoryResponse

@freezed
abstract class StoreProductCategoryResponse
    with _$StoreProductCategoryResponse {
  const StoreProductCategoryResponse._();

  @jsonSerializable
  const factory StoreProductCategoryResponse({
    /// productCategory
    @JsonKey(name: StoreProductCategoryResponse.productCategoryKey)
    required StoreProductCategory productCategory,
  }) = _StoreProductCategoryResponse;

  factory StoreProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductCategoryResponseFromJson(json);

  static const String productCategoryKey = r'product_category';
}
