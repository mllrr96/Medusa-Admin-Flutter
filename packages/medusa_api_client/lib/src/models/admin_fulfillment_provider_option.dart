/// AdminFulfillmentProviderOption
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The fulfillment option's ID.",
///             "title": "id"
///         },
///         "is_return": {
///             "type": "boolean",
///             "description": "Whether the fulfillment option is used for returns.",
///             "title": "is_return"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "is_return"
///     ],
///     "description": "The fulfillment option's details."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_provider_option.freezed.dart';
part 'admin_fulfillment_provider_option.g.dart'; // AdminFulfillmentProviderOption

@freezed
abstract class AdminFulfillmentProviderOption
    with _$AdminFulfillmentProviderOption {
  const AdminFulfillmentProviderOption._();

  @jsonSerializable
  const factory AdminFulfillmentProviderOption({
    /// id
    @JsonKey(name: AdminFulfillmentProviderOption.idKey) required String id,

    /// isReturn
    @JsonKey(name: AdminFulfillmentProviderOption.isReturnKey)
    required bool isReturn,
  }) = _AdminFulfillmentProviderOption;

  factory AdminFulfillmentProviderOption.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentProviderOptionFromJson(json);

  static const String idKey = r'id';

  static const String isReturnKey = r'is_return';
}
