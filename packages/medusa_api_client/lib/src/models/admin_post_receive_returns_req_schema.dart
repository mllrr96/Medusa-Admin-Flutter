/// AdminPostReceiveReturnsReqSchema
/// {
///     "properties": {
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "description": {
///             "type": "string",
///             "description": "The return's description.",
///             "title": "description"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The return receival details."
/// }
library;

import 'exports.dart';
part 'admin_post_receive_returns_req_schema.freezed.dart';
part 'admin_post_receive_returns_req_schema.g.dart'; // AdminPostReceiveReturnsReqSchema

@freezed
abstract class AdminPostReceiveReturnsReqSchema
    with _$AdminPostReceiveReturnsReqSchema {
  const AdminPostReceiveReturnsReqSchema._();

  @jsonSerializable
  const factory AdminPostReceiveReturnsReqSchema({
    /// internalNote
    @JsonKey(name: AdminPostReceiveReturnsReqSchema.internalNoteKey)
    required String internalNote,

    /// description
    @JsonKey(name: AdminPostReceiveReturnsReqSchema.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: AdminPostReceiveReturnsReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReceiveReturnsReqSchema;

  factory AdminPostReceiveReturnsReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReceiveReturnsReqSchemaFromJson(json);

  static const String internalNoteKey = r'internal_note';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';
}
