/// AdminFileResponse
/// {
///     "properties": {
///         "file": {
///             "$ref": "#/components/schemas/AdminFile"
///         }
///     },
///     "type": "object",
///     "required": [
///         "file"
///     ],
///     "description": "A file's details."
/// }
library;

import 'exports.dart';
part 'admin_file_response.freezed.dart';
part 'admin_file_response.g.dart'; // AdminFileResponse

@freezed
abstract class AdminFileResponse with _$AdminFileResponse {
  const AdminFileResponse._();

  @jsonSerializable
  const factory AdminFileResponse({
    /// file
    @JsonKey(name: AdminFileResponse.fileKey) required AdminFile file,
  }) = _AdminFileResponse;

  factory AdminFileResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminFileResponseFromJson(json);

  static const String fileKey = r'file';
}
