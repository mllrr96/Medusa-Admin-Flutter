/// AdminPostOrderExchangesReqSchema
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this exchange is created for.",
///             "title": "order_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The exchange's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The exchange's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_id"
///     ],
///     "description": "The exchange's details."
/// }
library;

import 'exports.dart';
part 'admin_post_order_exchanges_req_schema.freezed.dart';
part 'admin_post_order_exchanges_req_schema.g.dart'; // AdminPostOrderExchangesReqSchema

@freezed
abstract class AdminPostOrderExchangesReqSchema
    with _$AdminPostOrderExchangesReqSchema {
  const AdminPostOrderExchangesReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderExchangesReqSchema({
    /// orderId
    @JsonKey(name: AdminPostOrderExchangesReqSchema.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: AdminPostOrderExchangesReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostOrderExchangesReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostOrderExchangesReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostOrderExchangesReqSchema;

  factory AdminPostOrderExchangesReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderExchangesReqSchemaFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
