/// StorePaymentCollectionResponse
/// {
///     "properties": {
///         "payment_collection": {
///             "$ref": "#/components/schemas/StorePaymentCollection"
///         }
///     },
///     "type": "object",
///     "required": [
///         "payment_collection"
///     ],
///     "description": "The payment collection's details."
/// }
library;

import 'exports.dart';
part 'store_payment_collection_response.freezed.dart';
part 'store_payment_collection_response.g.dart'; // StorePaymentCollectionResponse

@freezed
abstract class StorePaymentCollectionResponse
    with _$StorePaymentCollectionResponse {
  const StorePaymentCollectionResponse._();

  @jsonSerializable
  const factory StorePaymentCollectionResponse({
    /// paymentCollection
    @JsonKey(name: StorePaymentCollectionResponse.paymentCollectionKey)
    required StorePaymentCollection paymentCollection,
  }) = _StorePaymentCollectionResponse;

  factory StorePaymentCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentCollectionResponseFromJson(json);

  static const String paymentCollectionKey = r'payment_collection';
}
