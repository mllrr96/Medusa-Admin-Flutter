/// RefundReason
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
library;

import 'exports.dart';
part 'refund_reason.freezed.dart';
part 'refund_reason.g.dart'; // RefundReason

@freezed
abstract class RefundReason with _$RefundReason {
  const RefundReason._();

  @jsonSerializable
  const factory RefundReason({
    /// id
    @JsonKey(name: RefundReason.idKey) required String id,

    /// label
    @JsonKey(name: RefundReason.labelKey) required String label,

    /// description
    @JsonKey(name: RefundReason.descriptionKey) required String description,

    /// metadata
    @JsonKey(name: RefundReason.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: RefundReason.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: RefundReason.updatedAtKey) required DateTime updatedAt,
  }) = _RefundReason;

  factory RefundReason.fromJson(Map<String, dynamic> json) =>
      _$RefundReasonFromJson(json);

  static const String idKey = r'id';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
