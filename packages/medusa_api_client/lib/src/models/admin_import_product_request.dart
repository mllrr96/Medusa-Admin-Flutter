/// AdminImportProductRequest
/// {
///     "properties": {
///         "file": {
///             "type": "object",
///             "description": "A File to upload.",
///             "title": "file"
///         }
///     },
///     "type": "object",
///     "required": [
///         "file"
///     ],
///     "description": "The import's details."
/// }
library;

import 'exports.dart';
part 'admin_import_product_request.freezed.dart';
part 'admin_import_product_request.g.dart'; // AdminImportProductRequest

@freezed
abstract class AdminImportProductRequest with _$AdminImportProductRequest {
  const AdminImportProductRequest._();

  @jsonSerializable
  const factory AdminImportProductRequest({
    /// file
    @JsonKey(name: AdminImportProductRequest.fileKey)
    required Map<String, dynamic> file,
  }) = _AdminImportProductRequest;

  factory AdminImportProductRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminImportProductRequestFromJson(json);

  static const String fileKey = r'file';
}
