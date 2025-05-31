/// BasePaymentProvider
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
///     "description": "The payment provider's details."
/// }
library base_payment_provider;

import 'exports.dart';
part 'base_payment_provider.freezed.dart';
part 'base_payment_provider.g.dart'; // BasePaymentProvider

@freezed
abstract class BasePaymentProvider with _$BasePaymentProvider {
  const BasePaymentProvider._();

  @jsonSerializable
  const factory BasePaymentProvider({
    /// id
    @JsonKey(name: BasePaymentProvider.idKey) required String id,
  }) = _BasePaymentProvider;

  factory BasePaymentProvider.fromJson(Map<String, dynamic> json) =>
      _$BasePaymentProviderFromJson(json);

  static const String idKey = r'id';
}
