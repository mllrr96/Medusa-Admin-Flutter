/// StoreReturnReason
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
library store_return_reason;

import 'exports.dart';
part 'store_return_reason.freezed.dart';
part 'store_return_reason.g.dart'; // StoreReturnReason

@freezed
abstract class StoreReturnReason with _$StoreReturnReason {
  const StoreReturnReason._();

  @jsonSerializable
  const factory StoreReturnReason({
    /// id
    @JsonKey(name: StoreReturnReason.idKey) required String id,

    /// value
    @JsonKey(name: StoreReturnReason.valueKey) required String value,

    /// label
    @JsonKey(name: StoreReturnReason.labelKey) required String label,

    /// description
    @JsonKey(name: StoreReturnReason.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: StoreReturnReason.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreReturnReason.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreReturnReason.updatedAtKey) required DateTime updatedAt,
  }) = _StoreReturnReason;

  factory StoreReturnReason.fromJson(Map<String, dynamic> json) =>
      _$StoreReturnReasonFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
