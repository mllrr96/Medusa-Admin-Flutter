/// AdminPostOrderEditsUpdateItemQuantityReqSchema
/// {
///     "properties": {
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "unit_price": {
///             "type": "number",
///             "description": "The item's unit price.",
///             "title": "unit_price"
///         },
///         "compare_at_unit_price": {
///             "type": "number",
///             "description": "The original price of the item before a promotion or sale.",
///             "title": "compare_at_unit_price"
///         }
///     },
///     "type": "object",
///     "required": [
///         "quantity"
///     ],
///     "description": "The order item's details to update."
/// }
library;

import 'exports.dart';
part 'admin_post_order_edits_update_item_quantity_req_schema.freezed.dart';
part 'admin_post_order_edits_update_item_quantity_req_schema.g.dart'; // AdminPostOrderEditsUpdateItemQuantityReqSchema

@freezed
abstract class AdminPostOrderEditsUpdateItemQuantityReqSchema
    with _$AdminPostOrderEditsUpdateItemQuantityReqSchema {
  const AdminPostOrderEditsUpdateItemQuantityReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsUpdateItemQuantityReqSchema({
    /// quantity
    @JsonKey(name: AdminPostOrderEditsUpdateItemQuantityReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(
      name: AdminPostOrderEditsUpdateItemQuantityReqSchema.internalNoteKey,
    )
    required String internalNote,

    /// unitPrice
    @JsonKey(name: AdminPostOrderEditsUpdateItemQuantityReqSchema.unitPriceKey)
    required double unitPrice,

    /// compareAtUnitPrice
    @JsonKey(
      name:
          AdminPostOrderEditsUpdateItemQuantityReqSchema.compareAtUnitPriceKey,
    )
    required double compareAtUnitPrice,
  }) = _AdminPostOrderEditsUpdateItemQuantityReqSchema;

  factory AdminPostOrderEditsUpdateItemQuantityReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderEditsUpdateItemQuantityReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';

  static const String unitPriceKey = r'unit_price';

  static const String compareAtUnitPriceKey = r'compare_at_unit_price';
}
