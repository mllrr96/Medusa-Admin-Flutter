/// AdminFulfillmentProvider
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The provider's ID.",
///             "title": "id"
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "The provider's is enabled.",
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
library;

import 'exports.dart';
part 'admin_fulfillment_provider.freezed.dart';
part 'admin_fulfillment_provider.g.dart'; // AdminFulfillmentProvider

@freezed
abstract class AdminFulfillmentProvider with _$AdminFulfillmentProvider {
  const AdminFulfillmentProvider._();

  @jsonSerializable
  const factory AdminFulfillmentProvider({
    /// id
    @JsonKey(name: AdminFulfillmentProvider.idKey) required String id,

    /// isEnabled
    @JsonKey(name: AdminFulfillmentProvider.isEnabledKey)
    required bool isEnabled,
  }) = _AdminFulfillmentProvider;

  factory AdminFulfillmentProvider.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentProviderFromJson(json);

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';
}
