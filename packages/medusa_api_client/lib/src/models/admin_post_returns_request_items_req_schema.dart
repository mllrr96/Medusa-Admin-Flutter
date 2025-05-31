/// AdminPostReturnsRequestItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The items' details."
///         }
///     },
///     "type": "object",
///     "description": "The items' details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_request_items_req_schema.freezed.dart';
part 'admin_post_returns_request_items_req_schema.g.dart'; // AdminPostReturnsRequestItemsReqSchema

@freezed
abstract class AdminPostReturnsRequestItemsReqSchema
    with _$AdminPostReturnsRequestItemsReqSchema {
  const AdminPostReturnsRequestItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsRequestItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostReturnsRequestItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostReturnsRequestItemsReqSchema;

  factory AdminPostReturnsRequestItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsRequestItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
