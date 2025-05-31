/// AdminUpdateReturnReason
/// {
///     "properties": {
///         "label": {
///             "type": "string",
///             "description": "The return reason's label.",
///             "title": "label"
///         },
///         "value": {
///             "type": "string",
///             "description": "The return reason's value.",
///             "title": "value"
///         },
///         "description": {
///             "type": "string",
///             "description": "The return reason's description.",
///             "title": "description"
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
///     "description": "The details to update in a return reason."
/// }
library admin_update_return_reason;

import 'exports.dart';
part 'admin_update_return_reason.freezed.dart';
part 'admin_update_return_reason.g.dart'; // AdminUpdateReturnReason

@freezed
abstract class AdminUpdateReturnReason with _$AdminUpdateReturnReason {
  const AdminUpdateReturnReason._();

  @jsonSerializable
  const factory AdminUpdateReturnReason({
    /// label
    @JsonKey(name: AdminUpdateReturnReason.labelKey) required String label,

    /// value
    @JsonKey(name: AdminUpdateReturnReason.valueKey) required String value,

    /// description
    @JsonKey(name: AdminUpdateReturnReason.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: AdminUpdateReturnReason.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateReturnReason;

  factory AdminUpdateReturnReason.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateReturnReasonFromJson(json);

  static const String labelKey = r'label';

  static const String valueKey = r'value';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';
}
