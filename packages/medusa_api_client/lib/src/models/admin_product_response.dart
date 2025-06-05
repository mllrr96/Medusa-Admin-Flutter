/// AdminProductResponse
/// {
///     "properties": {
///         "product": {
///             "$ref": "#/components/schemas/AdminProduct"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product"
///     ],
///     "description": "The product's details."
/// }
library;

import 'exports.dart';
part 'admin_product_response.freezed.dart';
part 'admin_product_response.g.dart'; // AdminProductResponse

@freezed
abstract class AdminProductResponse with _$AdminProductResponse {
  const AdminProductResponse._();

  @jsonSerializable
  const factory AdminProductResponse({
    /// product
    @JsonKey(name: AdminProductResponse.productKey)
    required AdminProduct product,
  }) = _AdminProductResponse;

  factory AdminProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductResponseFromJson(json);

  static const String productKey = r'product';
}
