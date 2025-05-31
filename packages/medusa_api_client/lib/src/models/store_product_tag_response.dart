/// StoreProductTagResponse
/// {
///     "properties": {
///         "product_tag": {
///             "$ref": "#/components/schemas/StoreProductTag"
///         }
///     },
///     "type": "object",
///     "required": [
///         "product_tag"
///     ],
///     "description": "The product tag's details."
/// }
library store_product_tag_response;

import 'exports.dart';
part 'store_product_tag_response.freezed.dart';
part 'store_product_tag_response.g.dart'; // StoreProductTagResponse

@freezed
abstract class StoreProductTagResponse with _$StoreProductTagResponse {
  const StoreProductTagResponse._();

  @jsonSerializable
  const factory StoreProductTagResponse({
    /// productTag
    @JsonKey(name: StoreProductTagResponse.productTagKey)
    required StoreProductTag productTag,
  }) = _StoreProductTagResponse;

  factory StoreProductTagResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTagResponseFromJson(json);

  static const String productTagKey = r'product_tag';
}
