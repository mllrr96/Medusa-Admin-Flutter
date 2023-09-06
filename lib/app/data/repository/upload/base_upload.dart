import 'dart:io';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/upload.dart';

abstract class BaseUpload {
  Future<Result<UserUploadFileRes, Failure>> uploadProtectedFile({
    required List<String> files,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserUploadFileRes, Failure>> uploadFile({
    required List<File> files,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteFileRes, Failure>> deleteFile({
    required String fileKey,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserGetFileUrlRes, Failure>> getFileUrl({
    required String fileKey,
    Map<String, dynamic>? customHeaders,
  });
}
