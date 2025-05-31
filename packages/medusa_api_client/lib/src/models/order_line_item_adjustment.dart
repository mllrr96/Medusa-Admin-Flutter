/// OrderLineItemAdjustment
/// {
///     "properties": {
///         "item": {
///             "type": "object"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item this adjustment is for.",
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
///             "description": "The ID of the promotion applied by this adjustment.",
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
///     "description": "The line item adjustment's details."
/// }
library order_line_item_adjustment;

import 'exports.dart';
part 'order_line_item_adjustment.freezed.dart';
part 'order_line_item_adjustment.g.dart'; // OrderLineItemAdjustment

@freezed
abstract class OrderLineItemAdjustment with _$OrderLineItemAdjustment {
  const OrderLineItemAdjustment._();

  @jsonSerializable
  const factory OrderLineItemAdjustment({
    /// item
    @JsonKey(name: OrderLineItemAdjustment.itemKey)
    required Map<String, dynamic> item,

    /// itemId
    @JsonKey(name: OrderLineItemAdjustment.itemIdKey) required String itemId,

    /// id
    @JsonKey(name: OrderLineItemAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: OrderLineItemAdjustment.codeKey) required String code,

    /// amount
    @JsonKey(name: OrderLineItemAdjustment.amountKey) required double amount,

    /// orderId
    @JsonKey(name: OrderLineItemAdjustment.orderIdKey) required String orderId,

    /// description
    @JsonKey(name: OrderLineItemAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: OrderLineItemAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: OrderLineItemAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: OrderLineItemAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderLineItemAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _OrderLineItemAdjustment;

  factory OrderLineItemAdjustment.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemAdjustmentFromJson(json);

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
