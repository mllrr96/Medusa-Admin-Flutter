/// AdminProductOptionResponse
/// {
///     "properties": {
///         "product_option": {
///             "$ref": "#/components/schemas/AdminProductOption"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_option"
///     ],
///     "description": "The product option's details."
/// }
library;

import 'exports.dart';
part 'admin_product_option_response.freezed.dart';
part 'admin_product_option_response.g.dart'; // AdminProductOptionResponse

@freezed
abstract class AdminProductOptionResponse with _$AdminProductOptionResponse {
  const AdminProductOptionResponse._();

  @jsonSerializable
  const factory AdminProductOptionResponse({
    /// productOption
    @JsonKey(name: AdminProductOptionResponse.productOptionKey)
    required AdminProductOption productOption,
  }) = _AdminProductOptionResponse;

  factory AdminProductOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductOptionResponseFromJson(json);

  static const String productOptionKey = r'product_option';
}
