/// BasePaymentCollection
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment collection's ID.",
///             "title": "id"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The payment collection's currency code.",
///             "title": "currency_code"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The total amount to be paid.",
///             "title": "amount"
///         },
///         "authorized_amount": {
///             "type": "number",
///             "description": "The total authorized amount of the collection's payments.",
///             "title": "authorized_amount"
///         },
///         "captured_amount": {
///             "type": "number",
///             "description": "The total captured amount of the collection's payments.",
///             "title": "captured_amount"
///         },
///         "refunded_amount": {
///             "type": "number",
///             "description": "The total refunded amount of the collection's payments.",
///             "title": "refunded_amount"
///         },
///         "completed_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment collection was completed.",
///             "title": "completed_at"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment collection was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment collection was updated.",
///             "title": "updated_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The payment collection's metadata, can hold custom key-value pairs."
///         },
///         "status": {
///             "enum": [
///                 "canceled",
///                 "not_paid",
///                 "awaiting",
///                 "authorized",
///                 "partially_authorized",
///                 "completed",
///                 "failed"
///             ],
///             "type": "string",
///             "description": "The payment collection's status."
///         },
///         "payment_providers": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BasePaymentProvider"
///             },
///             "description": "The payment provider used to process the collection's payments and sessions."
///         },
///         "payment_sessions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BasePaymentSession"
///             },
///             "description": "The payment collection's payment sessions."
///         },
///         "payments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BasePayment"
///             },
///             "description": "The payment collection's payments."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "currency_code",
///         "amount",
///         "status",
///         "payment_providers"
///     ],
///     "description": "The payment collection's details."
/// }
library;

import 'exports.dart';
part 'base_payment_collection.freezed.dart';
part 'base_payment_collection.g.dart'; // BasePaymentCollection

@freezed
abstract class BasePaymentCollection with _$BasePaymentCollection {
  const BasePaymentCollection._();

  @jsonSerializable
  const factory BasePaymentCollection({
    /// id
    @JsonKey(name: BasePaymentCollection.idKey) required String id,

    /// currencyCode
    @JsonKey(name: BasePaymentCollection.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: BasePaymentCollection.amountKey) required double amount,

    /// authorizedAmount
    @JsonKey(name: BasePaymentCollection.authorizedAmountKey)
    required double authorizedAmount,

    /// capturedAmount
    @JsonKey(name: BasePaymentCollection.capturedAmountKey)
    required double capturedAmount,

    /// refundedAmount
    @JsonKey(name: BasePaymentCollection.refundedAmountKey)
    required double refundedAmount,

    /// completedAt
    @JsonKey(name: BasePaymentCollection.completedAtKey)
    required DateTime completedAt,

    /// createdAt
    @JsonKey(name: BasePaymentCollection.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BasePaymentCollection.updatedAtKey)
    required DateTime updatedAt,

    /// metadata
    @JsonKey(name: BasePaymentCollection.metadataKey)
    required Map<String, dynamic> metadata,

    /// status
    @JsonKey(name: BasePaymentCollection.statusKey) required NullEnum status,

    /// paymentProviders
    @JsonKey(name: BasePaymentCollection.paymentProvidersKey)
    required List<BasePaymentProvider> paymentProviders,

    /// paymentSessions
    @JsonKey(name: BasePaymentCollection.paymentSessionsKey)
    required List<BasePaymentSession> paymentSessions,

    /// payments
    @JsonKey(name: BasePaymentCollection.paymentsKey)
    required List<BasePayment> payments,
  }) = _BasePaymentCollection;

  factory BasePaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$BasePaymentCollectionFromJson(json);

  static const String idKey = r'id';

  static const String currencyCodeKey = r'currency_code';

  static const String amountKey = r'amount';

  static const String authorizedAmountKey = r'authorized_amount';

  static const String capturedAmountKey = r'captured_amount';

  static const String refundedAmountKey = r'refunded_amount';

  static const String completedAtKey = r'completed_at';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String metadataKey = r'metadata';

  static const String statusKey = r'status';

  static const String paymentProvidersKey = r'payment_providers';

  static const String paymentSessionsKey = r'payment_sessions';

  static const String paymentsKey = r'payments';
}
