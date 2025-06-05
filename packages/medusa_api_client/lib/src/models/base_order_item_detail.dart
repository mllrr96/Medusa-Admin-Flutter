/// BaseOrderItemDetail
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "the detail's ID.",
///             "title": "id"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "the ID of the associated line item.",
///             "title": "id"
///         },
///         "item": {
///             "type": "object"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "fulfilled_quantity": {
///             "type": "number",
///             "description": "The item's fulfilled quantity.",
///             "title": "fulfilled_quantity"
///         },
///         "delivered_quantity": {
///             "type": "number",
///             "description": "The item's delivered quantity.",
///             "title": "fulfilled_quantity"
///         },
///         "shipped_quantity": {
///             "type": "number",
///             "description": "The item's shipped quantity.",
///             "title": "shipped_quantity"
///         },
///         "return_requested_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's requested to be returned.",
///             "title": "return_requested_quantity"
///         },
///         "return_received_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's returned and added to the underlying variant's stocked quantity.",
///             "title": "return_received_quantity"
///         },
///         "return_dismissed_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's returned but damaged. So, it's not added to the underlying variant's stocked quantity.",
///             "title": "return_dismissed_quantity"
///         },
///         "written_off_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's removed from the order.",
///             "title": "written_off_quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs.",
///             "title": "metadata"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the detail was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the detail was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "item_id",
///         "item",
///         "quantity",
///         "fulfilled_quantity",
///         "delivered_quantity",
///         "shipped_quantity",
///         "return_requested_quantity",
///         "return_received_quantity",
///         "return_dismissed_quantity",
///         "written_off_quantity",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The item's detail."
/// }
library;

import 'exports.dart';
part 'base_order_item_detail.freezed.dart';
part 'base_order_item_detail.g.dart'; // BaseOrderItemDetail

@freezed
abstract class BaseOrderItemDetail with _$BaseOrderItemDetail {
  const BaseOrderItemDetail._();

  @jsonSerializable
  const factory BaseOrderItemDetail({
    /// id
    @JsonKey(name: BaseOrderItemDetail.idKey) required String id,

    /// itemId
    @JsonKey(name: BaseOrderItemDetail.itemIdKey) required String itemId,

    /// item
    @JsonKey(name: BaseOrderItemDetail.itemKey)
    required Map<String, dynamic> item,

    /// quantity
    @JsonKey(name: BaseOrderItemDetail.quantityKey) required double quantity,

    /// fulfilledQuantity
    @JsonKey(name: BaseOrderItemDetail.fulfilledQuantityKey)
    required double fulfilledQuantity,

    /// deliveredQuantity
    @JsonKey(name: BaseOrderItemDetail.deliveredQuantityKey)
    required double deliveredQuantity,

    /// shippedQuantity
    @JsonKey(name: BaseOrderItemDetail.shippedQuantityKey)
    required double shippedQuantity,

    /// returnRequestedQuantity
    @JsonKey(name: BaseOrderItemDetail.returnRequestedQuantityKey)
    required double returnRequestedQuantity,

    /// returnReceivedQuantity
    @JsonKey(name: BaseOrderItemDetail.returnReceivedQuantityKey)
    required double returnReceivedQuantity,

    /// returnDismissedQuantity
    @JsonKey(name: BaseOrderItemDetail.returnDismissedQuantityKey)
    required double returnDismissedQuantity,

    /// writtenOffQuantity
    @JsonKey(name: BaseOrderItemDetail.writtenOffQuantityKey)
    required double writtenOffQuantity,

    /// metadata
    @JsonKey(name: BaseOrderItemDetail.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseOrderItemDetail.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderItemDetail.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderItemDetail;

  factory BaseOrderItemDetail.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderItemDetailFromJson(json);

  static const String idKey = r'id';

  static const String itemIdKey = r'item_id';

  static const String itemKey = r'item';

  static const String quantityKey = r'quantity';

  static const String fulfilledQuantityKey = r'fulfilled_quantity';

  static const String deliveredQuantityKey = r'delivered_quantity';

  static const String shippedQuantityKey = r'shipped_quantity';

  static const String returnRequestedQuantityKey = r'return_requested_quantity';

  static const String returnReceivedQuantityKey = r'return_received_quantity';

  static const String returnDismissedQuantityKey = r'return_dismissed_quantity';

  static const String writtenOffQuantityKey = r'written_off_quantity';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
