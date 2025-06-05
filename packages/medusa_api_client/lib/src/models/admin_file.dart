/// AdminFile
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The file's ID.",
///             "title": "id"
///         },
///         "url": {
///             "type": "string",
///             "description": "The file's URL.",
///             "title": "url"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "url"
///     ],
///     "description": "A file's details."
/// }
library;

import 'exports.dart';
part 'admin_file.freezed.dart';
part 'admin_file.g.dart'; // AdminFile

@freezed
abstract class AdminFile with _$AdminFile {
  const AdminFile._();

  @jsonSerializable
  const factory AdminFile({
    /// id
    @JsonKey(name: AdminFile.idKey) required String id,

    /// url
    @JsonKey(name: AdminFile.urlKey) required String url,
  }) = _AdminFile;

  factory AdminFile.fromJson(Map<String, dynamic> json) =>
      _$AdminFileFromJson(json);

  static const String idKey = r'id';

  static const String urlKey = r'url';
}
