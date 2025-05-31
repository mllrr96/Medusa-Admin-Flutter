/// BaseOrderLineItemAdjustment
/// {
///     "properties": {
///         "item": {
///             "type": "object"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item this adjustment applies to.",
///             "title": "item_id"
///         },
///         "id": {
///             "type": "string",
///             "description": "The adjustment's ID.",
///             "title": "id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The adjustment's code.",
///             "title": "code"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The adjustment's amount.",
///             "title": "amount"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the associated order.",
///             "title": "order_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The adjustment's description.",
///             "title": "description"
///         },
///         "promotion_id": {
///             "type": "string",
///             "description": "The ID of the promotion that this applies on the order's item.",
///             "title": "promotion_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The adjustment's provider ID.",
///             "title": "provider_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the adjustment was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the adjustment was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "item",
///         "item_id",
///         "id",
///         "amount",
///         "order_id",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The adjustment's details."
/// }
library;

import 'exports.dart';
part 'base_order_line_item_adjustment.freezed.dart';
part 'base_order_line_item_adjustment.g.dart'; // BaseOrderLineItemAdjustment

@freezed
abstract class BaseOrderLineItemAdjustment with _$BaseOrderLineItemAdjustment {
  const BaseOrderLineItemAdjustment._();

  @jsonSerializable
  const factory BaseOrderLineItemAdjustment({
    /// item
    @JsonKey(name: BaseOrderLineItemAdjustment.itemKey)
    required Map<String, dynamic> item,

    /// itemId
    @JsonKey(name: BaseOrderLineItemAdjustment.itemIdKey)
    required String itemId,

    /// id
    @JsonKey(name: BaseOrderLineItemAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: BaseOrderLineItemAdjustment.codeKey) required String code,

    /// amount
    @JsonKey(name: BaseOrderLineItemAdjustment.amountKey)
    required double amount,

    /// orderId
    @JsonKey(name: BaseOrderLineItemAdjustment.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: BaseOrderLineItemAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: BaseOrderLineItemAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: BaseOrderLineItemAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseOrderLineItemAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderLineItemAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderLineItemAdjustment;

  factory BaseOrderLineItemAdjustment.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderLineItemAdjustmentFromJson(json);

  static const String itemKey = r'item';

  static const String itemIdKey = r'item_id';

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String amountKey = r'amount';

  static const String orderIdKey = r'order_id';

  static const String descriptionKey = r'description';

  static const String promotionIdKey = r'promotion_id';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
