/// AdminTaxProvider
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tax provider's ID.",
///             "title": "id"
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "Whether the tax provider is enabled in the Medusa application.",
///             "title": "is_enabled"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "is_enabled"
///     ],
///     "description": "The tax provider's details."
/// }
library;

import 'exports.dart';
part 'admin_tax_provider.freezed.dart';
part 'admin_tax_provider.g.dart'; // AdminTaxProvider

@freezed
abstract class AdminTaxProvider with _$AdminTaxProvider {
  const AdminTaxProvider._();

  @jsonSerializable
  const factory AdminTaxProvider({
    /// id
    @JsonKey(name: AdminTaxProvider.idKey) required String id,

    /// isEnabled
    @JsonKey(name: AdminTaxProvider.isEnabledKey) required bool isEnabled,
  }) = _AdminTaxProvider;

  factory AdminTaxProvider.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxProviderFromJson(json);

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';
}
