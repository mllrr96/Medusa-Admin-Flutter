/// BaseFulfillmentProvider
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The provider's ID.",
///             "title": "id"
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "Whether the provider is enabled.",
///             "title": "is_enabled"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "is_enabled"
///     ],
///     "description": "The fulfillment provider's details."
/// }
library base_fulfillment_provider;

import 'exports.dart';
part 'base_fulfillment_provider.freezed.dart';
part 'base_fulfillment_provider.g.dart'; // BaseFulfillmentProvider

@freezed
abstract class BaseFulfillmentProvider with _$BaseFulfillmentProvider {
  const BaseFulfillmentProvider._();

  @jsonSerializable
  const factory BaseFulfillmentProvider({
    /// id
    @JsonKey(name: BaseFulfillmentProvider.idKey) required String id,

    /// isEnabled
    @JsonKey(name: BaseFulfillmentProvider.isEnabledKey)
    required bool isEnabled,
  }) = _BaseFulfillmentProvider;

  factory BaseFulfillmentProvider.fromJson(Map<String, dynamic> json) =>
      _$BaseFulfillmentProviderFromJson(json);

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';
}
