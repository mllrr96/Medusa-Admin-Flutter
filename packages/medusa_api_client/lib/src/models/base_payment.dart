/// BasePayment
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment's ID.",
///             "title": "id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The payment's amount.",
///             "title": "amount"
///         },
///         "authorized_amount": {
///             "type": "number",
///             "description": "The amount authorized of the payment.",
///             "title": "authorized_amount"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The payment's currency code.",
///             "title": "currency_code"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the payment provider used to process this payment.",
///             "title": "provider_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The payment's data, useful for processing by the payment provider."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment was updated.",
///             "title": "updated_at"
///         },
///         "captured_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment was captured.",
///             "title": "captured_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment was canceled.",
///             "title": "canceled_at"
///         },
///         "captured_amount": {
///             "type": "number",
///             "description": "The captured amount of the payment.",
///             "title": "captured_amount"
///         },
///         "refunded_amount": {
///             "type": "number",
///             "description": "The refunded amount of the payment.",
///             "title": "captured_amount"
///         },
///         "captures": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseCapture"
///             },
///             "description": "The details of payment captures."
///         },
///         "refunds": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseRefund"
///             },
///             "description": "The details of payment refunds."
///         },
///         "payment_collection": {
///             "type": "object"
///         },
///         "payment_session": {
///             "type": "object"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "amount",
///         "currency_code",
///         "provider_id"
///     ],
///     "description": "The payment's details."
/// }
library base_payment;

import 'exports.dart';
part 'base_payment.freezed.dart';
part 'base_payment.g.dart'; // BasePayment

@freezed
abstract class BasePayment with _$BasePayment {
  const BasePayment._();

  @jsonSerializable
  const factory BasePayment({
    /// id
    @JsonKey(name: BasePayment.idKey) required String id,

    /// amount
    @JsonKey(name: BasePayment.amountKey) required double amount,

    /// authorizedAmount
    @JsonKey(name: BasePayment.authorizedAmountKey)
    required double authorizedAmount,

    /// currencyCode
    @JsonKey(name: BasePayment.currencyCodeKey) required String currencyCode,

    /// providerId
    @JsonKey(name: BasePayment.providerIdKey) required String providerId,

    /// data
    @JsonKey(name: BasePayment.dataKey) required Map<String, dynamic> data,

    /// createdAt
    @JsonKey(name: BasePayment.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BasePayment.updatedAtKey) required DateTime updatedAt,

    /// capturedAt
    @JsonKey(name: BasePayment.capturedAtKey) required DateTime capturedAt,

    /// canceledAt
    @JsonKey(name: BasePayment.canceledAtKey) required DateTime canceledAt,

    /// capturedAmount
    @JsonKey(name: BasePayment.capturedAmountKey)
    required double capturedAmount,

    /// refundedAmount
    @JsonKey(name: BasePayment.refundedAmountKey)
    required double refundedAmount,

    /// captures
    @JsonKey(name: BasePayment.capturesKey) required List<BaseCapture> captures,

    /// refunds
    @JsonKey(name: BasePayment.refundsKey) required List<BaseRefund> refunds,

    /// paymentCollection
    @JsonKey(name: BasePayment.paymentCollectionKey)
    required Map<String, dynamic> paymentCollection,

    /// paymentSession
    @JsonKey(name: BasePayment.paymentSessionKey)
    required Map<String, dynamic> paymentSession,
  }) = _BasePayment;

  factory BasePayment.fromJson(Map<String, dynamic> json) =>
      _$BasePaymentFromJson(json);

  static const String idKey = r'id';

  static const String amountKey = r'amount';

  static const String authorizedAmountKey = r'authorized_amount';

  static const String currencyCodeKey = r'currency_code';

  static const String providerIdKey = r'provider_id';

  static const String dataKey = r'data';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String capturedAtKey = r'captured_at';

  static const String canceledAtKey = r'canceled_at';

  static const String capturedAmountKey = r'captured_amount';

  static const String refundedAmountKey = r'refunded_amount';

  static const String capturesKey = r'captures';

  static const String refundsKey = r'refunds';

  static const String paymentCollectionKey = r'payment_collection';

  static const String paymentSessionKey = r'payment_session';
}
