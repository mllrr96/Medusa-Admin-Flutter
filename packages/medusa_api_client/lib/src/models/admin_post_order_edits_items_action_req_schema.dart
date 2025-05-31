/// AdminPostOrderEditsItemsActionReqSchema
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
///     "description": "The details to update in the item."
/// }
library;

import 'exports.dart';
part 'admin_post_order_edits_items_action_req_schema.freezed.dart';
part 'admin_post_order_edits_items_action_req_schema.g.dart'; // AdminPostOrderEditsItemsActionReqSchema

@freezed
abstract class AdminPostOrderEditsItemsActionReqSchema
    with _$AdminPostOrderEditsItemsActionReqSchema {
  const AdminPostOrderEditsItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostOrderEditsItemsActionReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(name: AdminPostOrderEditsItemsActionReqSchema.internalNoteKey)
    required String internalNote,

    /// unitPrice
    @JsonKey(name: AdminPostOrderEditsItemsActionReqSchema.unitPriceKey)
    required double unitPrice,

    /// compareAtUnitPrice
    @JsonKey(
      name: AdminPostOrderEditsItemsActionReqSchema.compareAtUnitPriceKey,
    )
    required double compareAtUnitPrice,
  }) = _AdminPostOrderEditsItemsActionReqSchema;

  factory AdminPostOrderEditsItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderEditsItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';

  static const String unitPriceKey = r'unit_price';

  static const String compareAtUnitPriceKey = r'compare_at_unit_price';
}
