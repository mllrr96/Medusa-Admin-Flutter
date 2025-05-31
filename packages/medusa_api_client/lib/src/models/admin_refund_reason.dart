/// AdminRefundReason
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The refund reason's ID.",
///             "title": "id"
///         },
///         "label": {
///             "type": "string",
///             "description": "The refund reason's label.",
///             "title": "label"
///         },
///         "description": {
///             "type": "string",
///             "description": "The refund reason's description.",
///             "title": "description"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The refund reason's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the refund reason was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the refund reason was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "label",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The refund reason's details."
/// }
library admin_refund_reason;

import 'exports.dart';
part 'admin_refund_reason.freezed.dart';
part 'admin_refund_reason.g.dart'; // AdminRefundReason

@freezed
abstract class AdminRefundReason with _$AdminRefundReason {
  const AdminRefundReason._();

  @jsonSerializable
  const factory AdminRefundReason({
    /// id
    @JsonKey(name: AdminRefundReason.idKey) required String id,

    /// label
    @JsonKey(name: AdminRefundReason.labelKey) required String label,

    /// description
    @JsonKey(name: AdminRefundReason.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: AdminRefundReason.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminRefundReason.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminRefundReason.updatedAtKey) required DateTime updatedAt,
  }) = _AdminRefundReason;

  factory AdminRefundReason.fromJson(Map<String, dynamic> json) =>
      _$AdminRefundReasonFromJson(json);

  static const String idKey = r'id';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
