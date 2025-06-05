/// StoreProductTypeResponse
/// {
///     "properties": {
///         "product_type": {
///             "$ref": "#/components/schemas/StoreProductType"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_type"
///     ],
///     "description": "The product type's details."
/// }
library;

import 'exports.dart';
part 'store_product_type_response.freezed.dart';
part 'store_product_type_response.g.dart'; // StoreProductTypeResponse

@freezed
abstract class StoreProductTypeResponse with _$StoreProductTypeResponse {
  const StoreProductTypeResponse._();

  @jsonSerializable
  const factory StoreProductTypeResponse({
    /// productType
    @JsonKey(name: StoreProductTypeResponse.productTypeKey)
    required StoreProductType productType,
  }) = _StoreProductTypeResponse;

  factory StoreProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTypeResponseFromJson(json);

  static const String productTypeKey = r'product_type';
}
