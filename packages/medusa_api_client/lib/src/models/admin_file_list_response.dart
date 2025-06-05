/// AdminFileListResponse
/// {
///     "properties": {
///         "files": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFile"
///             },
///             "description": "The list of uploaded files."
///         }
///     },
///     "type": "object",
///     "required": [
///         "files"
///     ],
///     "description": "The list of uploaded files."
/// }
library;

import 'exports.dart';
part 'admin_file_list_response.freezed.dart';
part 'admin_file_list_response.g.dart'; // AdminFileListResponse

@freezed
abstract class AdminFileListResponse with _$AdminFileListResponse {
  const AdminFileListResponse._();

  @jsonSerializable
  const factory AdminFileListResponse({
    /// files
    @JsonKey(name: AdminFileListResponse.filesKey)
    required List<AdminFile> files,
  }) = _AdminFileListResponse;

  factory AdminFileListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminFileListResponseFromJson(json);

  static const String filesKey = r'files';
}
