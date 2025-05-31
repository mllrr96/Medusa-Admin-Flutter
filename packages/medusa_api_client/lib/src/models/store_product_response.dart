/// StoreProductResponse
/// {
///     "properties": {
///         "product": {
///             "$ref": "#/components/schemas/StoreProduct"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product"
///     ],
///     "description": "The product's details."
/// }
library store_product_response;

import 'exports.dart';
part 'store_product_response.freezed.dart';
part 'store_product_response.g.dart'; // StoreProductResponse

@freezed
abstract class StoreProductResponse with _$StoreProductResponse {
  const StoreProductResponse._();

  @jsonSerializable
  const factory StoreProductResponse({
    /// product
    @JsonKey(name: StoreProductResponse.productKey)
    required StoreProduct product,
  }) = _StoreProductResponse;

  factory StoreProductResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductResponseFromJson(json);

  static const String productKey = r'product';
}
