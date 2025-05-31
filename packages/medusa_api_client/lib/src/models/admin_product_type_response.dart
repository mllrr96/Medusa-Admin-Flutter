/// AdminProductTypeResponse
/// {
///     "properties": {
///         "product_type": {
///             "$ref": "#/components/schemas/AdminProductType"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_type"
///     ],
///     "description": "The product type's details."
/// }
library admin_product_type_response;

import 'exports.dart';
part 'admin_product_type_response.freezed.dart';
part 'admin_product_type_response.g.dart'; // AdminProductTypeResponse

@freezed
abstract class AdminProductTypeResponse with _$AdminProductTypeResponse {
  const AdminProductTypeResponse._();

  @jsonSerializable
  const factory AdminProductTypeResponse({
    /// productType
    @JsonKey(name: AdminProductTypeResponse.productTypeKey)
    required AdminProductType productType,
  }) = _AdminProductTypeResponse;

  factory AdminProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTypeResponseFromJson(json);

  static const String productTypeKey = r'product_type';
}
