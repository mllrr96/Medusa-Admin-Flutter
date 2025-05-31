/// AdminPostClaimsAddItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The outbound item's details."
///         }
///     },
///     "type": "object",
///     "description": "The details of the outbound items to add to the claim."
/// }
library;

import 'exports.dart';
part 'admin_post_claims_add_items_req_schema.freezed.dart';
part 'admin_post_claims_add_items_req_schema.g.dart'; // AdminPostClaimsAddItemsReqSchema

@freezed
abstract class AdminPostClaimsAddItemsReqSchema
    with _$AdminPostClaimsAddItemsReqSchema {
  const AdminPostClaimsAddItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostClaimsAddItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostClaimsAddItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostClaimsAddItemsReqSchema;

  factory AdminPostClaimsAddItemsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostClaimsAddItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
