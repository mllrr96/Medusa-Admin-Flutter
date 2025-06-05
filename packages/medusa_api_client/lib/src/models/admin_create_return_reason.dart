/// AdminCreateReturnReason
/// {
///     "properties": {
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
///         "parent_return_reason_id": {
///             "type": "string",
///             "description": "The ID of the parent return reason.",
///             "title": "parent_return_reason_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return reason's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "value",
///         "label"
///     ],
///     "description": "The details of the return reason to create."
/// }
library;

import 'exports.dart';
part 'admin_create_return_reason.freezed.dart';
part 'admin_create_return_reason.g.dart'; // AdminCreateReturnReason

@freezed
abstract class AdminCreateReturnReason with _$AdminCreateReturnReason {
  const AdminCreateReturnReason._();

  @jsonSerializable
  const factory AdminCreateReturnReason({
    /// value
    @JsonKey(name: AdminCreateReturnReason.valueKey) required String value,

    /// label
    @JsonKey(name: AdminCreateReturnReason.labelKey) required String label,

    /// description
    @JsonKey(name: AdminCreateReturnReason.descriptionKey)
    required String description,

    /// parentReturnReasonId
    @JsonKey(name: AdminCreateReturnReason.parentReturnReasonIdKey)
    required String parentReturnReasonId,

    /// metadata
    @JsonKey(name: AdminCreateReturnReason.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateReturnReason;

  factory AdminCreateReturnReason.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateReturnReasonFromJson(json);

  static const String valueKey = r'value';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String parentReturnReasonIdKey = r'parent_return_reason_id';

  static const String metadataKey = r'metadata';
}
