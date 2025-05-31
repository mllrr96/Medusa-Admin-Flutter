/// AdminCreateRefundReason
/// {
///     "properties": {
///         "label": {
///             "type": "string",
///             "description": "The refund reason's label.",
///             "title": "label"
///         },
///         "description": {
///             "type": "string",
///             "description": "The refund reason's description.",
///             "title": "description"
///         }
///     },
///     "type": "object",
///     "required": [
///         "label"
///     ],
///     "description": "The refund reason's details."
/// }
library admin_create_refund_reason;

import 'exports.dart';
part 'admin_create_refund_reason.freezed.dart';
part 'admin_create_refund_reason.g.dart'; // AdminCreateRefundReason

@freezed
abstract class AdminCreateRefundReason with _$AdminCreateRefundReason {
  const AdminCreateRefundReason._();

  @jsonSerializable
  const factory AdminCreateRefundReason({
    /// label
    @JsonKey(name: AdminCreateRefundReason.labelKey) required String label,

    /// description
    @JsonKey(name: AdminCreateRefundReason.descriptionKey)
    required String description,
  }) = _AdminCreateRefundReason;

  factory AdminCreateRefundReason.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateRefundReasonFromJson(json);

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';
}
