/// AdminPaymentCollectionResponse
/// {
///     "properties": {
///         "payment_collection": {
///             "$ref": "#/components/schemas/AdminPaymentCollection"
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
part 'admin_payment_collection_response.freezed.dart';
part 'admin_payment_collection_response.g.dart'; // AdminPaymentCollectionResponse

@freezed
abstract class AdminPaymentCollectionResponse
    with _$AdminPaymentCollectionResponse {
  const AdminPaymentCollectionResponse._();

  @jsonSerializable
  const factory AdminPaymentCollectionResponse({
    /// paymentCollection
    @JsonKey(name: AdminPaymentCollectionResponse.paymentCollectionKey)
    required AdminPaymentCollection paymentCollection,
  }) = _AdminPaymentCollectionResponse;

  factory AdminPaymentCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPaymentCollectionResponseFromJson(json);

  static const String paymentCollectionKey = r'payment_collection';
}
