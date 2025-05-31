/// StoreCreatePaymentCollection
/// {
///     "properties": {
///         "cart_id": {
///             "type": "string",
///             "description": "The ID of the cart this payment collection is for.",
///             "title": "cart_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "cart_id"
///     ],
///     "description": "The details of the payment collection to create."
/// }
library;

import 'exports.dart';
part 'store_create_payment_collection.freezed.dart';
part 'store_create_payment_collection.g.dart'; // StoreCreatePaymentCollection

@freezed
abstract class StoreCreatePaymentCollection
    with _$StoreCreatePaymentCollection {
  const StoreCreatePaymentCollection._();

  @jsonSerializable
  const factory StoreCreatePaymentCollection({
    /// cartId
    @JsonKey(name: StoreCreatePaymentCollection.cartIdKey)
    required String cartId,
  }) = _StoreCreatePaymentCollection;

  factory StoreCreatePaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$StoreCreatePaymentCollectionFromJson(json);

  static const String cartIdKey = r'cart_id';
}
