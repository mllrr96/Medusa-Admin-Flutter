/// AdminRefund
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The refund's ID.",
///             "title": "id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The refund's amount.",
///             "title": "amount"
///         },
///         "refund_reason_id": {
///             "type": "string",
///             "description": "The ID of the refund reason.",
///             "title": "refund_reason_id"
///         },
///         "note": {
///             "type": "string",
///             "description": "More details about the refund.",
///             "title": "note"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the refund was created.",
///             "title": "created_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the refund.",
///             "title": "created_by"
///         },
///         "payment": {
///             "$ref": "#/components/schemas/BasePayment"
///         },
///         "refund_reason": {
///             "$ref": "#/components/schemas/RefundReason"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "amount",
///         "created_at",
///         "payment"
///     ],
///     "description": "The refund's details."
/// }
library;

import 'exports.dart';
part 'admin_refund.freezed.dart';
part 'admin_refund.g.dart'; // AdminRefund

@freezed
abstract class AdminRefund with _$AdminRefund {
  const AdminRefund._();

  @jsonSerializable
  const factory AdminRefund({
    /// id
    @JsonKey(name: AdminRefund.idKey) required String id,

    /// amount
    @JsonKey(name: AdminRefund.amountKey) required double amount,

    /// refundReasonId
    @JsonKey(name: AdminRefund.refundReasonIdKey)
    required String refundReasonId,

    /// note
    @JsonKey(name: AdminRefund.noteKey) required String note,

    /// createdAt
    @JsonKey(name: AdminRefund.createdAtKey) required DateTime createdAt,

    /// createdBy
    @JsonKey(name: AdminRefund.createdByKey) required String createdBy,

    /// payment
    @JsonKey(name: AdminRefund.paymentKey) required BasePayment payment,

    /// refundReason
    @JsonKey(name: AdminRefund.refundReasonKey)
    required RefundReason refundReason,
  }) = _AdminRefund;

  factory AdminRefund.fromJson(Map<String, dynamic> json) =>
      _$AdminRefundFromJson(json);

  static const String idKey = r'id';

  static const String amountKey = r'amount';

  static const String refundReasonIdKey = r'refund_reason_id';

  static const String noteKey = r'note';

  static const String createdAtKey = r'created_at';

  static const String createdByKey = r'created_by';

  static const String paymentKey = r'payment';

  static const String refundReasonKey = r'refund_reason';
}
