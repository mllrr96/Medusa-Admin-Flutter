/// AdminPostOrderClaimsReqSchema
/// {
///     "properties": {
///         "type": {
///             "enum": [
///                 "refund",
///                 "replace"
///             ],
///             "type": "string",
///             "description": "The claim's type."
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the claim is created for.",
///             "title": "order_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The claim's description.",
///             "title": "description"
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
///             "description": "The claim's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "type",
///         "order_id"
///     ],
///     "description": "The claim's details."
/// }
library;

import 'exports.dart';
part 'admin_post_order_claims_req_schema.freezed.dart';
part 'admin_post_order_claims_req_schema.g.dart'; // AdminPostOrderClaimsReqSchema

@freezed
abstract class AdminPostOrderClaimsReqSchema
    with _$AdminPostOrderClaimsReqSchema {
  const AdminPostOrderClaimsReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderClaimsReqSchema({
    /// type
    @JsonKey(name: AdminPostOrderClaimsReqSchema.typeKey)
    required NullEnum type,

    /// orderId
    @JsonKey(name: AdminPostOrderClaimsReqSchema.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: AdminPostOrderClaimsReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostOrderClaimsReqSchema.internalNoteKey)
    required String internalNote,

    /// reasonId
    @JsonKey(name: AdminPostOrderClaimsReqSchema.reasonIdKey)
    required String reasonId,

    /// metadata
    @JsonKey(name: AdminPostOrderClaimsReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostOrderClaimsReqSchema;

  factory AdminPostOrderClaimsReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostOrderClaimsReqSchemaFromJson(json);

  static const String typeKey = r'type';

  static const String orderIdKey = r'order_id';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String reasonIdKey = r'reason_id';

  static const String metadataKey = r'metadata';
}
