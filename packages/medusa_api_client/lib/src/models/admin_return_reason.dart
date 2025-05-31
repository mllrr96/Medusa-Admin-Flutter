/// AdminReturnReason
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The return reason's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The return reason's value.",
///             "title": "value"
///         },
///         "label": {
///             "type": "string",
///             "description": "The return reason's label.",
///             "title": "label"
///         },
///         "description": {
///             "type": "string",
///             "description": "The return reason's description.",
///             "title": "description"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return reason's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return reason was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return reason was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "label",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The return reason's details."
/// }
library admin_return_reason;

import 'exports.dart';
part 'admin_return_reason.freezed.dart';
part 'admin_return_reason.g.dart'; // AdminReturnReason

@freezed
abstract class AdminReturnReason with _$AdminReturnReason {
  const AdminReturnReason._();

  @jsonSerializable
  const factory AdminReturnReason({
    /// id
    @JsonKey(name: AdminReturnReason.idKey) required String id,

    /// value
    @JsonKey(name: AdminReturnReason.valueKey) required String value,

    /// label
    @JsonKey(name: AdminReturnReason.labelKey) required String label,

    /// description
    @JsonKey(name: AdminReturnReason.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: AdminReturnReason.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminReturnReason.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminReturnReason.updatedAtKey) required DateTime updatedAt,
  }) = _AdminReturnReason;

  factory AdminReturnReason.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnReasonFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
