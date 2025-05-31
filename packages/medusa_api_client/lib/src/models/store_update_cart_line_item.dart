/// StoreUpdateCartLineItem
/// {
///     "properties": {
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
///         "quantity"
///     ],
///     "description": "The details to update in the line item."
/// }
library store_update_cart_line_item;

import 'exports.dart';
part 'store_update_cart_line_item.freezed.dart';
part 'store_update_cart_line_item.g.dart'; // StoreUpdateCartLineItem

@freezed
abstract class StoreUpdateCartLineItem with _$StoreUpdateCartLineItem {
  const StoreUpdateCartLineItem._();

  @jsonSerializable
  const factory StoreUpdateCartLineItem({
    /// quantity
    @JsonKey(name: StoreUpdateCartLineItem.quantityKey)
    required double quantity,

    /// metadata
    @JsonKey(name: StoreUpdateCartLineItem.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreUpdateCartLineItem;

  factory StoreUpdateCartLineItem.fromJson(Map<String, dynamic> json) =>
      _$StoreUpdateCartLineItemFromJson(json);

  static const String quantityKey = r'quantity';

  static const String metadataKey = r'metadata';
}
