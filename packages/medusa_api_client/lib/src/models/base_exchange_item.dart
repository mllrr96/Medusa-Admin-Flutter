/// BaseExchangeItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the exchange this item belongs to.",
///             "title": "exchange_id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this item belongs to.",
///             "title": "order_id"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item in the order.",
///             "title": "item_id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "exchange_id",
///         "order_id",
///         "item_id",
///         "quantity",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The item's details."
/// }
library;

import 'exports.dart';
part 'base_exchange_item.freezed.dart';
part 'base_exchange_item.g.dart'; // BaseExchangeItem

@freezed
abstract class BaseExchangeItem with _$BaseExchangeItem {
  const BaseExchangeItem._();

  @jsonSerializable
  const factory BaseExchangeItem({
    /// id
    @JsonKey(name: BaseExchangeItem.idKey) required String id,

    /// exchangeId
    @JsonKey(name: BaseExchangeItem.exchangeIdKey) required String exchangeId,

    /// orderId
    @JsonKey(name: BaseExchangeItem.orderIdKey) required String orderId,

    /// itemId
    @JsonKey(name: BaseExchangeItem.itemIdKey) required String itemId,

    /// quantity
    @JsonKey(name: BaseExchangeItem.quantityKey) required double quantity,

    /// metadata
    @JsonKey(name: BaseExchangeItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseExchangeItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseExchangeItem.updatedAtKey) required DateTime updatedAt,
  }) = _BaseExchangeItem;

  factory BaseExchangeItem.fromJson(Map<String, dynamic> json) =>
      _$BaseExchangeItemFromJson(json);

  static const String idKey = r'id';

  static const String exchangeIdKey = r'exchange_id';

  static const String orderIdKey = r'order_id';

  static const String itemIdKey = r'item_id';

  static const String quantityKey = r'quantity';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
