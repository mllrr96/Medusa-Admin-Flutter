import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UploadUseCase {
  UploadRepository get _uploadRepository =>
      getIt<MedusaAdmin>().uploadRepository;

  static UploadUseCase get instance => getIt<UploadUseCase>();

  Future<Result<List<String>, Failure>> call(List<File> files,
      {Map<String, dynamic>? customHeaders}) async {
    try {
      final result = await _uploadRepository.uploadFile(
          files: files, customHeaders: customHeaders);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<List<String>, Failure>> uploadProtected(List<File> files,
      {Map<String, dynamic>? customHeaders}) async {
    try {
      final result = await _uploadRepository.uploadProtectedFile(
          files: files, customHeaders: customHeaders);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
