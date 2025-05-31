/// AdminPostReturnsReceiveItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The items details."
///         }
///     },
///     "type": "object",
///     "description": "The items details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_receive_items_req_schema.freezed.dart';
part 'admin_post_returns_receive_items_req_schema.g.dart'; // AdminPostReturnsReceiveItemsReqSchema

@freezed
abstract class AdminPostReturnsReceiveItemsReqSchema
    with _$AdminPostReturnsReceiveItemsReqSchema {
  const AdminPostReturnsReceiveItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsReceiveItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostReturnsReceiveItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostReturnsReceiveItemsReqSchema;

  factory AdminPostReturnsReceiveItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsReceiveItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
