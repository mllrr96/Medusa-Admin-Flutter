/// BaseClaimItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The claim item's ID.",
///             "title": "id"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the claim this item belongs to.",
///             "title": "claim_id"
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
///             "description": "The quantity claimed.",
///             "title": "quantity"
///         },
///         "reason": {
///             "enum": [
///                 "missing_item",
///                 "wrong_item",
///                 "production_failure",
///                 "other"
///             ],
///             "type": "string",
///             "description": "The claim's reason."
///         },
///         "raw_quantity": {
///             "type": "object",
///             "description": "The quantity claimed."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "claim_id",
///         "order_id",
///         "item_id",
///         "quantity",
///         "reason",
///         "raw_quantity"
///     ],
///     "description": "The claim item's details."
/// }
library;

import 'exports.dart';
part 'base_claim_item.freezed.dart';
part 'base_claim_item.g.dart'; // BaseClaimItem

@freezed
abstract class BaseClaimItem with _$BaseClaimItem {
  const BaseClaimItem._();

  @jsonSerializable
  const factory BaseClaimItem({
    /// id
    @JsonKey(name: BaseClaimItem.idKey) required String id,

    /// claimId
    @JsonKey(name: BaseClaimItem.claimIdKey) required String claimId,

    /// orderId
    @JsonKey(name: BaseClaimItem.orderIdKey) required String orderId,

    /// itemId
    @JsonKey(name: BaseClaimItem.itemIdKey) required String itemId,

    /// quantity
    @JsonKey(name: BaseClaimItem.quantityKey) required double quantity,

    /// reason
    @JsonKey(name: BaseClaimItem.reasonKey) required NullEnum reason,

    /// rawQuantity
    @JsonKey(name: BaseClaimItem.rawQuantityKey)
    required Map<String, dynamic> rawQuantity,

    /// metadata
    @JsonKey(name: BaseClaimItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseClaimItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseClaimItem.updatedAtKey) required DateTime updatedAt,
  }) = _BaseClaimItem;

  factory BaseClaimItem.fromJson(Map<String, dynamic> json) =>
      _$BaseClaimItemFromJson(json);

  static const String idKey = r'id';

  static const String claimIdKey = r'claim_id';

  static const String orderIdKey = r'order_id';

  static const String itemIdKey = r'item_id';

  static const String quantityKey = r'quantity';

  static const String reasonKey = r'reason';

  static const String rawQuantityKey = r'raw_quantity';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
