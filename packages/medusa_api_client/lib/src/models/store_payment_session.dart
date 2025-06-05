/// StorePaymentSession
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment session's ID.",
///             "title": "id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The payment session's amount.",
///             "title": "amount"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The payment session's currency code.",
///             "title": "currency_code"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the payment provider processing this session.",
///             "title": "provider_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The payment session's data, useful for the payment provider processing the payment."
///         },
///         "context": {
///             "type": "object",
///             "description": "The context around the payment, such as the customer's details."
///         },
///         "status": {
///             "enum": [
///                 "authorized",
///                 "captured",
///                 "canceled",
///                 "pending",
///                 "requires_more",
///                 "error"
///             ],
///             "type": "string",
///             "description": "The payment session's status."
///         },
///         "authorized_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the payment session was authorized.",
///             "title": "authorized_at"
///         },
///         "payment_collection": {
///             "type": "object"
///         },
///         "payment": {
///             "$ref": "#/components/schemas/BasePayment"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "amount",
///         "currency_code",
///         "provider_id",
///         "data",
///         "status"
///     ],
///     "description": "The payment session's details."
/// }
library;

import 'exports.dart';
part 'store_payment_session.freezed.dart';
part 'store_payment_session.g.dart'; // StorePaymentSession

@freezed
abstract class StorePaymentSession with _$StorePaymentSession {
  const StorePaymentSession._();

  @jsonSerializable
  const factory StorePaymentSession({
    /// id
    @JsonKey(name: StorePaymentSession.idKey) required String id,

    /// amount
    @JsonKey(name: StorePaymentSession.amountKey) required double amount,

    /// currencyCode
    @JsonKey(name: StorePaymentSession.currencyCodeKey)
    required String currencyCode,

    /// providerId
    @JsonKey(name: StorePaymentSession.providerIdKey)
    required String providerId,

    /// data
    @JsonKey(name: StorePaymentSession.dataKey)
    required Map<String, dynamic> data,

    /// context
    @JsonKey(name: StorePaymentSession.contextKey)
    required Map<String, dynamic> context,

    /// status
    @JsonKey(name: StorePaymentSession.statusKey) required NullEnum status,

    /// authorizedAt
    @JsonKey(name: StorePaymentSession.authorizedAtKey)
    required DateTime authorizedAt,

    /// paymentCollection
    @JsonKey(name: StorePaymentSession.paymentCollectionKey)
    required Map<String, dynamic> paymentCollection,

    /// payment
    @JsonKey(name: StorePaymentSession.paymentKey) required BasePayment payment,
  }) = _StorePaymentSession;

  factory StorePaymentSession.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentSessionFromJson(json);

  static const String idKey = r'id';

  static const String amountKey = r'amount';

  static const String currencyCodeKey = r'currency_code';

  static const String providerIdKey = r'provider_id';

  static const String dataKey = r'data';

  static const String contextKey = r'context';

  static const String statusKey = r'status';

  static const String authorizedAtKey = r'authorized_at';

  static const String paymentCollectionKey = r'payment_collection';

  static const String paymentKey = r'payment';
}
