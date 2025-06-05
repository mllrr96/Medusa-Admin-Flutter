/// StorePaymentProvider
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment provider's ID.",
///             "title": "id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The payment provider's details"
/// }
library;

import 'exports.dart';
part 'store_payment_provider.freezed.dart';
part 'store_payment_provider.g.dart'; // StorePaymentProvider

@freezed
abstract class StorePaymentProvider with _$StorePaymentProvider {
  const StorePaymentProvider._();

  @jsonSerializable
  const factory StorePaymentProvider({
    /// id
    @JsonKey(name: StorePaymentProvider.idKey) required String id,
  }) = _StorePaymentProvider;

  factory StorePaymentProvider.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentProviderFromJson(json);

  static const String idKey = r'id';
}
