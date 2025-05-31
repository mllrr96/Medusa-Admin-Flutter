/// BaseOrderSummary
/// {
///     "properties": {
///         "paid_total": {
///             "type": "number",
///             "description": "The total amount paid.",
///             "title": "paid_total"
///         },
///         "refunded_total": {
///             "type": "number",
///             "description": "The total amount refunded.",
///             "title": "refunded_total"
///         },
///         "pending_difference": {
///             "type": "number",
///             "description": "The difference pending to be processed. If negative, the customer needs a refund. Otherwise, additional payment is required from the customer.",
///             "title": "pending_difference"
///         },
///         "current_order_total": {
///             "type": "number",
///             "description": "The order's current total, could be the total after a change in the order.",
///             "title": "current_order_total"
///         },
///         "original_order_total": {
///             "type": "number",
///             "description": "The order's original total.",
///             "title": "original_order_total"
///         },
///         "transaction_total": {
///             "type": "number",
///             "description": "The total of the transactions made on the order.",
///             "title": "transaction_total"
///         },
///         "accounting_total": {
///             "type": "number",
///             "description": "The order's total without the credit-line total.",
///             "title": "accounting_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "pending_difference",
///         "current_order_total",
///         "original_order_total",
///         "transaction_total",
///         "paid_total",
///         "refunded_total",
///         "accounting_total"
///     ],
///     "description": "The order's summary details."
/// }
library base_order_summary;

import 'exports.dart';
part 'base_order_summary.freezed.dart';
part 'base_order_summary.g.dart'; // BaseOrderSummary

@freezed
abstract class BaseOrderSummary with _$BaseOrderSummary {
  const BaseOrderSummary._();

  @jsonSerializable
  const factory BaseOrderSummary({
    /// paidTotal
    @JsonKey(name: BaseOrderSummary.paidTotalKey) required double paidTotal,

    /// refundedTotal
    @JsonKey(name: BaseOrderSummary.refundedTotalKey)
    required double refundedTotal,

    /// pendingDifference
    @JsonKey(name: BaseOrderSummary.pendingDifferenceKey)
    required double pendingDifference,

    /// currentOrderTotal
    @JsonKey(name: BaseOrderSummary.currentOrderTotalKey)
    required double currentOrderTotal,

    /// originalOrderTotal
    @JsonKey(name: BaseOrderSummary.originalOrderTotalKey)
    required double originalOrderTotal,

    /// transactionTotal
    @JsonKey(name: BaseOrderSummary.transactionTotalKey)
    required double transactionTotal,

    /// accountingTotal
    @JsonKey(name: BaseOrderSummary.accountingTotalKey)
    required double accountingTotal,
  }) = _BaseOrderSummary;

  factory BaseOrderSummary.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderSummaryFromJson(json);

  static const String paidTotalKey = r'paid_total';

  static const String refundedTotalKey = r'refunded_total';

  static const String pendingDifferenceKey = r'pending_difference';

  static const String currentOrderTotalKey = r'current_order_total';

  static const String originalOrderTotalKey = r'original_order_total';

  static const String transactionTotalKey = r'transaction_total';

  static const String accountingTotalKey = r'accounting_total';
}
