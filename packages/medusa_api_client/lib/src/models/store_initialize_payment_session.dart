/// StoreInitializePaymentSession
/// {
///     "properties": {
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the payment provider the customer chose.",
///             "title": "provider_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "Any data necessary for the payment provider to process the payment."
///         }
///     },
///     "type": "object",
///     "required": [
///         "provider_id"
///     ],
///     "description": "The payment session's details."
/// }
library;

import 'exports.dart';
part 'store_initialize_payment_session.freezed.dart';
part 'store_initialize_payment_session.g.dart'; // StoreInitializePaymentSession

@freezed
abstract class StoreInitializePaymentSession
    with _$StoreInitializePaymentSession {
  const StoreInitializePaymentSession._();

  @jsonSerializable
  const factory StoreInitializePaymentSession({
    /// providerId
    @JsonKey(name: StoreInitializePaymentSession.providerIdKey)
    required String providerId,

    /// data
    @JsonKey(name: StoreInitializePaymentSession.dataKey)
    required Map<String, dynamic> data,
  }) = _StoreInitializePaymentSession;

  factory StoreInitializePaymentSession.fromJson(Map<String, dynamic> json) =>
      _$StoreInitializePaymentSessionFromJson(json);

  static const String providerIdKey = r'provider_id';

  static const String dataKey = r'data';
}
