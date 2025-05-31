/// AdminPostClaimItemsReqSchema
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "An item's details."
///             },
///             "description": "The item's details."
///         }
///     },
///     "type": "object",
///     "description": "The details of the order items to add to the claim."
/// }
library;

import 'exports.dart';
part 'admin_post_claim_items_req_schema.freezed.dart';
part 'admin_post_claim_items_req_schema.g.dart'; // AdminPostClaimItemsReqSchema

@freezed
abstract class AdminPostClaimItemsReqSchema
    with _$AdminPostClaimItemsReqSchema {
  const AdminPostClaimItemsReqSchema._();

  @jsonSerializable
  const factory AdminPostClaimItemsReqSchema({
    /// items
    @JsonKey(name: AdminPostClaimItemsReqSchema.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminPostClaimItemsReqSchema;

  factory AdminPostClaimItemsReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostClaimItemsReqSchemaFromJson(json);

  static const String itemsKey = r'items';
}
