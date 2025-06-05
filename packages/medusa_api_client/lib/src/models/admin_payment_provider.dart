/// AdminPaymentProvider
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment provider's ID.",
///             "title": "id"
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "Whether the payment provider is enabled.",
///             "title": "is_enabled"
///         }
///     },
///     "type": "object",
///     "required": [
///         "is_enabled",
///         "id"
///     ],
///     "description": "The payment provider's details."
/// }
library;

import 'exports.dart';
part 'admin_payment_provider.freezed.dart';
part 'admin_payment_provider.g.dart'; // AdminPaymentProvider

@freezed
abstract class AdminPaymentProvider with _$AdminPaymentProvider {
  const AdminPaymentProvider._();

  @jsonSerializable
  const factory AdminPaymentProvider({
    /// id
    @JsonKey(name: AdminPaymentProvider.idKey) required String id,

    /// isEnabled
    @JsonKey(name: AdminPaymentProvider.isEnabledKey) required bool isEnabled,
  }) = _AdminPaymentProvider;

  factory AdminPaymentProvider.fromJson(Map<String, dynamic> json) =>
      _$AdminPaymentProviderFromJson(json);

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';
}
