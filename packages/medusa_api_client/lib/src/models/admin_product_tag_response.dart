/// AdminProductTagResponse
/// {
///     "properties": {
///         "product_tag": {
///             "$ref": "#/components/schemas/AdminProductTag"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_tag"
///     ],
///     "description": "The product tag's details."
/// }
library;

import 'exports.dart';
part 'admin_product_tag_response.freezed.dart';
part 'admin_product_tag_response.g.dart'; // AdminProductTagResponse

@freezed
abstract class AdminProductTagResponse with _$AdminProductTagResponse {
  const AdminProductTagResponse._();

  @jsonSerializable
  const factory AdminProductTagResponse({
    /// productTag
    @JsonKey(name: AdminProductTagResponse.productTagKey)
    required AdminProductTag productTag,
  }) = _AdminProductTagResponse;

  factory AdminProductTagResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTagResponseFromJson(json);

  static const String productTagKey = r'product_tag';
}
