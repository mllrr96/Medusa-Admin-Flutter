/// AdminPaymentCollection
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
///                 "$ref": "#/components/schemas/AdminPaymentProvider"
///             },
///             "description": "The payment provider used to process the collection's payments and sessions."
///         },
///         "payment_sessions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPaymentSession"
///             },
///             "description": "The payment collection's payment sessions."
///         },
///         "payments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPayment"
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
library admin_payment_collection;

import 'exports.dart';
part 'admin_payment_collection.freezed.dart';
part 'admin_payment_collection.g.dart'; // AdminPaymentCollection

@freezed
abstract class AdminPaymentCollection with _$AdminPaymentCollection {
  const AdminPaymentCollection._();

  @jsonSerializable
  const factory AdminPaymentCollection({
    /// id
    @JsonKey(name: AdminPaymentCollection.idKey) required String id,

    /// currencyCode
    @JsonKey(name: AdminPaymentCollection.currencyCodeKey)
    required String currencyCode,

    /// amount
    @JsonKey(name: AdminPaymentCollection.amountKey) required double amount,

    /// authorizedAmount
    @JsonKey(name: AdminPaymentCollection.authorizedAmountKey)
    required double authorizedAmount,

    /// capturedAmount
    @JsonKey(name: AdminPaymentCollection.capturedAmountKey)
    required double capturedAmount,

    /// refundedAmount
    @JsonKey(name: AdminPaymentCollection.refundedAmountKey)
    required double refundedAmount,

    /// completedAt
    @JsonKey(name: AdminPaymentCollection.completedAtKey)
    required DateTime completedAt,

    /// createdAt
    @JsonKey(name: AdminPaymentCollection.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPaymentCollection.updatedAtKey)
    required DateTime updatedAt,

    /// metadata
    @JsonKey(name: AdminPaymentCollection.metadataKey)
    required Map<String, dynamic> metadata,

    /// status
    @JsonKey(name: AdminPaymentCollection.statusKey) required NullEnum status,

    /// paymentProviders
    @JsonKey(name: AdminPaymentCollection.paymentProvidersKey)
    required List<AdminPaymentProvider> paymentProviders,

    /// paymentSessions
    @JsonKey(name: AdminPaymentCollection.paymentSessionsKey)
    required List<AdminPaymentSession> paymentSessions,

    /// payments
    @JsonKey(name: AdminPaymentCollection.paymentsKey)
    required List<AdminPayment> payments,
  }) = _AdminPaymentCollection;

  factory AdminPaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$AdminPaymentCollectionFromJson(json);

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
