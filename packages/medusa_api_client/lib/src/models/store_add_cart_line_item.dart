/// StoreAddCartLineItem
/// {
///     "properties": {
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the product variant to add to the cart.",
///             "title": "variant_id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "variant_id",
///         "quantity"
///     ],
///     "description": "The details of the line item to add."
/// }
library;

import 'exports.dart';
part 'store_add_cart_line_item.freezed.dart';
part 'store_add_cart_line_item.g.dart'; // StoreAddCartLineItem

@freezed
abstract class StoreAddCartLineItem with _$StoreAddCartLineItem {
  const StoreAddCartLineItem._();

  @jsonSerializable
  const factory StoreAddCartLineItem({
    /// variantId
    @JsonKey(name: StoreAddCartLineItem.variantIdKey) required String variantId,

    /// quantity
    @JsonKey(name: StoreAddCartLineItem.quantityKey) required double quantity,

    /// metadata
    @JsonKey(name: StoreAddCartLineItem.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreAddCartLineItem;

  factory StoreAddCartLineItem.fromJson(Map<String, dynamic> json) =>
      _$StoreAddCartLineItemFromJson(json);

  static const String variantIdKey = r'variant_id';

  static const String quantityKey = r'quantity';

  static const String metadataKey = r'metadata';
}
