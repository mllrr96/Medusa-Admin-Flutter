/// AdminUpdateApiKey
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The API key's title.",
///             "title": "title"
///         }
///     },
///     "type": "object",
///     "required": [
///         "title"
///     ],
///     "description": "The details to update in an API key."
/// }
library;

import 'exports.dart';
part 'admin_update_api_key.freezed.dart';
part 'admin_update_api_key.g.dart'; // AdminUpdateApiKey

@freezed
abstract class AdminUpdateApiKey with _$AdminUpdateApiKey {
  const AdminUpdateApiKey._();

  @jsonSerializable
  const factory AdminUpdateApiKey({
    /// title
    @JsonKey(name: AdminUpdateApiKey.titleKey) required String title,
  }) = _AdminUpdateApiKey;

  factory AdminUpdateApiKey.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateApiKeyFromJson(json);

  static const String titleKey = r'title';
}
