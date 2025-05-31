/// AdminPostExchangesRequestItemsReturnActionReqSchema
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
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the associated return reason.",
///             "title": "reason_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The exchange's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in an inbound (returned) item."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_request_items_return_action_req_schema.freezed.dart';
part 'admin_post_exchanges_request_items_return_action_req_schema.g.dart'; // AdminPostExchangesRequestItemsReturnActionReqSchema

@freezed
abstract class AdminPostExchangesRequestItemsReturnActionReqSchema
    with _$AdminPostExchangesRequestItemsReturnActionReqSchema {
  const AdminPostExchangesRequestItemsReturnActionReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesRequestItemsReturnActionReqSchema({
    /// quantity
    @JsonKey(
      name: AdminPostExchangesRequestItemsReturnActionReqSchema.quantityKey,
    )
    required double quantity,

    /// internalNote
    @JsonKey(
      name: AdminPostExchangesRequestItemsReturnActionReqSchema.internalNoteKey,
    )
    required String internalNote,

    /// reasonId
    @JsonKey(
      name: AdminPostExchangesRequestItemsReturnActionReqSchema.reasonIdKey,
    )
    required String reasonId,

    /// metadata
    @JsonKey(
      name: AdminPostExchangesRequestItemsReturnActionReqSchema.metadataKey,
    )
    required Map<String, dynamic> metadata,
  }) = _AdminPostExchangesRequestItemsReturnActionReqSchema;

  factory AdminPostExchangesRequestItemsReturnActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesRequestItemsReturnActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';

  static const String reasonIdKey = r'reason_id';

  static const String metadataKey = r'metadata';
}
