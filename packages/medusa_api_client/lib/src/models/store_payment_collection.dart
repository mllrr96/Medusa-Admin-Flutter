/// StorePaymentCollection
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
///                 "partially_authorized"
///             ],
///             "type": "string",
///             "description": "The payment collection's status."
///         },
///         "payment_providers": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StorePaymentProvider"
///             },
///             "description": "The payment provider used to process the collection's payments and sessions."
///         },
///         "payment_sessions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StorePaymentSession"
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
///         "payment_providers",
///         "id",
///         "currency_code",
///         "amount",
///         "status"
///     ],
///     "description": "The payment collection's details."
/// }
library store_payment_collection;

import 'exports.dart';
part 'store_payment_collection.freezed.dart';
part 'store_payment_collection.g.dart'; // StorePaymentCollection

@freezed
abstract class StorePaymentCollection with _$StorePaymentCollection {
  const StorePaymentCollection._();

  @jsonSerializable
  const factory StorePaymentCollection({
    /// id
    @JsonKey(name: StorePaymentCollection.idKey) required String id,

    /// currencyCode
    @JsonKey(name: StorePaymentCollection.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: StorePaymentCollection.amountKey) required double amount,

    /// authorizedAmount
    @JsonKey(name: StorePaymentCollection.authorizedAmountKey)
    required double authorizedAmount,

    /// capturedAmount
    @JsonKey(name: StorePaymentCollection.capturedAmountKey)
    required double capturedAmount,

    /// refundedAmount
    @JsonKey(name: StorePaymentCollection.refundedAmountKey)
    required double refundedAmount,

    /// completedAt
    @JsonKey(name: StorePaymentCollection.completedAtKey)
    required DateTime completedAt,

    /// createdAt
    @JsonKey(name: StorePaymentCollection.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StorePaymentCollection.updatedAtKey)
    required DateTime updatedAt,

    /// metadata
    @JsonKey(name: StorePaymentCollection.metadataKey)
    required Map<String, dynamic> metadata,

    /// status
    @JsonKey(name: StorePaymentCollection.statusKey) required NullEnum status,

    /// paymentProviders
    @JsonKey(name: StorePaymentCollection.paymentProvidersKey)
    required List<StorePaymentProvider> paymentProviders,

    /// paymentSessions
    @JsonKey(name: StorePaymentCollection.paymentSessionsKey)
    required List<StorePaymentSession> paymentSessions,

    /// payments
    @JsonKey(name: StorePaymentCollection.paymentsKey)
    required List<BasePayment> payments,
  }) = _StorePaymentCollection;

  factory StorePaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentCollectionFromJson(json);

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
