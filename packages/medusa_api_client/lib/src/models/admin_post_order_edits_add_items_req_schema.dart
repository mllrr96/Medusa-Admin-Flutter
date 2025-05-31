/// AdminPostOrderEditsAddItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The details of items to be edited."
///         }
///     },
///     "type": "object",
///     "description": "The details of items to be edited."
/// }
library;

import 'exports.dart';
part 'admin_post_order_edits_add_items_req_schema.freezed.dart';
part 'admin_post_order_edits_add_items_req_schema.g.dart'; // AdminPostOrderEditsAddItemsReqSchema

@freezed
abstract class AdminPostOrderEditsAddItemsReqSchema
    with _$AdminPostOrderEditsAddItemsReqSchema {
  const AdminPostOrderEditsAddItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsAddItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostOrderEditsAddItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostOrderEditsAddItemsReqSchema;

  factory AdminPostOrderEditsAddItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderEditsAddItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
