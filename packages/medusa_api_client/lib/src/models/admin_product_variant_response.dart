/// AdminProductVariantResponse
/// {
///     "properties": {
///         "variant": {
///             "$ref": "#/components/schemas/AdminProductVariant"
///         }
///     },
///     "type": "object",
///     "required": [
///         "variant"
///     ],
///     "description": "The product variant's details."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_response.freezed.dart';
part 'admin_product_variant_response.g.dart'; // AdminProductVariantResponse

@freezed
abstract class AdminProductVariantResponse with _$AdminProductVariantResponse {
  const AdminProductVariantResponse._();

  @jsonSerializable
  const factory AdminProductVariantResponse({
    /// variant
    @JsonKey(name: AdminProductVariantResponse.variantKey)
    required AdminProductVariant variant,
  }) = _AdminProductVariantResponse;

  factory AdminProductVariantResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductVariantResponseFromJson(json);

  static const String variantKey = r'variant';
}
