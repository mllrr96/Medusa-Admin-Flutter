/// BaseRefund
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
///             "type": "object"
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
part 'base_refund.freezed.dart';
part 'base_refund.g.dart'; // BaseRefund

@freezed
abstract class BaseRefund with _$BaseRefund {
  const BaseRefund._();

  @jsonSerializable
  const factory BaseRefund({
    /// id
    @JsonKey(name: BaseRefund.idKey) required String id,

    /// amount
    @JsonKey(name: BaseRefund.amountKey) required double amount,

    /// refundReasonId
    @JsonKey(name: BaseRefund.refundReasonIdKey) required String refundReasonId,

    /// note
    @JsonKey(name: BaseRefund.noteKey) required String note,

    /// createdAt
    @JsonKey(name: BaseRefund.createdAtKey) required DateTime createdAt,

    /// createdBy
    @JsonKey(name: BaseRefund.createdByKey) required String createdBy,

    /// payment
    @JsonKey(name: BaseRefund.paymentKey) required Map<String, dynamic> payment,

    /// refundReason
    @JsonKey(name: BaseRefund.refundReasonKey)
    required RefundReason refundReason,
  }) = _BaseRefund;

  factory BaseRefund.fromJson(Map<String, dynamic> json) =>
      _$BaseRefundFromJson(json);

  static const String idKey = r'id';

  static const String amountKey = r'amount';

  static const String refundReasonIdKey = r'refund_reason_id';

  static const String noteKey = r'note';

  static const String createdAtKey = r'created_at';

  static const String createdByKey = r'created_by';

  static const String paymentKey = r'payment';

  static const String refundReasonKey = r'refund_reason';
}
