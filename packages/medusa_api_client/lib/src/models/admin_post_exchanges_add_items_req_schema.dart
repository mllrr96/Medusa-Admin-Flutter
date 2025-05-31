/// AdminPostExchangesAddItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The details of outbound items."
///         }
///     },
///     "type": "object",
///     "description": "The details of outbound items."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_add_items_req_schema.freezed.dart';
part 'admin_post_exchanges_add_items_req_schema.g.dart'; // AdminPostExchangesAddItemsReqSchema

@freezed
abstract class AdminPostExchangesAddItemsReqSchema
    with _$AdminPostExchangesAddItemsReqSchema {
  const AdminPostExchangesAddItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesAddItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostExchangesAddItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostExchangesAddItemsReqSchema;

  factory AdminPostExchangesAddItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesAddItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
