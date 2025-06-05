/// AdminPlugin
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The plugin's name.",
///             "title": "name"
///         }
///     },
///     "type": "object",
///     "required": [
///         "name"
///     ],
///     "description": "The plugin's details."
/// }
library;

import 'exports.dart';
part 'admin_plugin.freezed.dart';
part 'admin_plugin.g.dart'; // AdminPlugin

@freezed
abstract class AdminPlugin with _$AdminPlugin {
  const AdminPlugin._();

  @jsonSerializable
  const factory AdminPlugin({
    /// name
    @JsonKey(name: AdminPlugin.nameKey) required String name,
  }) = _AdminPlugin;

  factory AdminPlugin.fromJson(Map<String, dynamic> json) =>
      _$AdminPluginFromJson(json);

  static const String nameKey = r'name';
}
