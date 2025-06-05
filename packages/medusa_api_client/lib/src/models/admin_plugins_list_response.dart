/// AdminPluginsListResponse
/// {
///     "properties": {
///         "plugins": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPlugin"
///             },
///             "description": "The list of plugins."
///         }
///     },
///     "type": "object",
///     "required": [
///         "plugins"
///     ],
///     "description": "The list of plugins."
/// }
library;

import 'exports.dart';
part 'admin_plugins_list_response.freezed.dart';
part 'admin_plugins_list_response.g.dart'; // AdminPluginsListResponse

@freezed
abstract class AdminPluginsListResponse with _$AdminPluginsListResponse {
  const AdminPluginsListResponse._();

  @jsonSerializable
  const factory AdminPluginsListResponse({
    /// plugins
    @JsonKey(name: AdminPluginsListResponse.pluginsKey)
    required List<AdminPlugin> plugins,
  }) = _AdminPluginsListResponse;

  factory AdminPluginsListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPluginsListResponseFromJson(json);

  static const String pluginsKey = r'plugins';
}
