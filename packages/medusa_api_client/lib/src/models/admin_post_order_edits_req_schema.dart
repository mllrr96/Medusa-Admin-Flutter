/// AdminPostOrderEditsReqSchema
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this edit is for.",
///             "title": "order_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The order edit's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order edit's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_id"
///     ],
///     "description": "The order edit's details."
/// }
library;

import 'exports.dart';
part 'admin_post_order_edits_req_schema.freezed.dart';
part 'admin_post_order_edits_req_schema.g.dart'; // AdminPostOrderEditsReqSchema

@freezed
abstract class AdminPostOrderEditsReqSchema
    with _$AdminPostOrderEditsReqSchema {
  const AdminPostOrderEditsReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsReqSchema({
    /// orderId
    @JsonKey(name: AdminPostOrderEditsReqSchema.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: AdminPostOrderEditsReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostOrderEditsReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostOrderEditsReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostOrderEditsReqSchema;

  factory AdminPostOrderEditsReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostOrderEditsReqSchemaFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
