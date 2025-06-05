/// BaseLineItemAdjustment
/// {
///     "properties": {
///         "item": {
///             "type": "object"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item this adjustment applies on.",
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
///         "cart_id": {
///             "type": "string",
///             "description": "The ID of the cart this adjustment belongs to.",
///             "title": "cart_id"
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
///         "cart_id",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The adjustment's details."
/// }
library;

import 'exports.dart';
part 'base_line_item_adjustment.freezed.dart';
part 'base_line_item_adjustment.g.dart'; // BaseLineItemAdjustment

@freezed
abstract class BaseLineItemAdjustment with _$BaseLineItemAdjustment {
  const BaseLineItemAdjustment._();

  @jsonSerializable
  const factory BaseLineItemAdjustment({
    /// item
    @JsonKey(name: BaseLineItemAdjustment.itemKey)
    required Map<String, dynamic> item,

    /// itemId
    @JsonKey(name: BaseLineItemAdjustment.itemIdKey) required String itemId,

    /// id
    @JsonKey(name: BaseLineItemAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: BaseLineItemAdjustment.codeKey) required String code,

    /// amount
    @JsonKey(name: BaseLineItemAdjustment.amountKey) required double amount,

    /// cartId
    @JsonKey(name: BaseLineItemAdjustment.cartIdKey) required String cartId,

    /// description
    @JsonKey(name: BaseLineItemAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: BaseLineItemAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: BaseLineItemAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseLineItemAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseLineItemAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseLineItemAdjustment;

  factory BaseLineItemAdjustment.fromJson(Map<String, dynamic> json) =>
      _$BaseLineItemAdjustmentFromJson(json);

  static const String itemKey = r'item';

  static const String itemIdKey = r'item_id';

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String amountKey = r'amount';

  static const String cartIdKey = r'cart_id';

  static const String descriptionKey = r'description';

  static const String promotionIdKey = r'promotion_id';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
