/// AdminPostExchangesReturnRequestItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The details of the inbound (return) items."
///         }
///     },
///     "type": "object",
///     "description": "The details of the inbound (return) items."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_return_request_items_req_schema.freezed.dart';
part 'admin_post_exchanges_return_request_items_req_schema.g.dart'; // AdminPostExchangesReturnRequestItemsReqSchema

@freezed
abstract class AdminPostExchangesReturnRequestItemsReqSchema
    with _$AdminPostExchangesReturnRequestItemsReqSchema {
  const AdminPostExchangesReturnRequestItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesReturnRequestItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostExchangesReturnRequestItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostExchangesReturnRequestItemsReqSchema;

  factory AdminPostExchangesReturnRequestItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesReturnRequestItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
