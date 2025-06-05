/// AdminCreateApiKey
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The API key's title.",
///             "title": "title"
///         },
///         "type": {
///             "enum": [
///                 "publishable",
///                 "secret"
///             ],
///             "type": "string",
///             "description": "The API key's type. Use `secret` for a user's API key; Use `publishable` for Publishable API keys."
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "type"
///     ],
///     "description": "The API key's details."
/// }
library;

import 'exports.dart';
part 'admin_create_api_key.freezed.dart';
part 'admin_create_api_key.g.dart'; // AdminCreateApiKey

@freezed
abstract class AdminCreateApiKey with _$AdminCreateApiKey {
  const AdminCreateApiKey._();

  @jsonSerializable
  const factory AdminCreateApiKey({
    /// title
    @JsonKey(name: AdminCreateApiKey.titleKey) required String title,

    /// type
    @JsonKey(name: AdminCreateApiKey.typeKey) required NullEnum type,
  }) = _AdminCreateApiKey;

  factory AdminCreateApiKey.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateApiKeyFromJson(json);

  static const String titleKey = r'title';

  static const String typeKey = r'type';
}
