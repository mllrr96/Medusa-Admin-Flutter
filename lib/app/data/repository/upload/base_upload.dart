import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/upload.dart';

abstract class BaseUpload {
  /// Uploads at least one file with ACL or a non-public bucket to the specific file service that is installed in Medusa.
  Future<Result<UserUploadFileRes, Failure>> uploadProtectedFile({
    required List<String> files,
    Map<String, dynamic>? customHeaders,
  });

  /// Uploads at least one file to the specific file service that is installed in Medusa.
  Future<Result<UserUploadFileRes, Failure>> uploadFile({
    required List<String> files,
    Map<String, dynamic>? customHeaders,
  });

  /// Removes an uploaded file using the installed file service
  Future<Result<UserDeleteFileRes, Failure>> deleteFile({
    /// key of the file to delete
    required String fileKey,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a pre-signed download url for a file
  Future<Result<UserGetFileUrlRes, Failure>> getFileUrl({
    /// key of the file to obtain the download link for
    required String fileKey,
    Map<String, dynamic>? customHeaders,
  });
}
