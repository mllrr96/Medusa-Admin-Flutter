import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/utils/file_use_case/delete_file_use_case.dart';
import 'package:medusa_admin/src/core/utils/file_use_case/get_file_url_use_case.dart';
import 'package:medusa_admin/src/core/utils/file_use_case/upload_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'upload_files_state.dart';

part 'upload_files_cubit.freezed.dart';

@injectable
class UploadFilesCubit extends Cubit<UploadFilesState> {
  UploadFilesCubit(
      this.uploadUseCase, this.deleteFileUseCase, this.getFileUrlUseCase)
      : super(const _Initial());

  Future<void> uploadFiles(List<File> files) async {
    emit(const _Uploading());
    // TODO: fix this
    final result = await uploadUseCase(FormData());
    result.when((result) {
      final urls = result.map((e) => e.url).toList();
      emit(_Uploaded(urls));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> deleteFile(String url) async {
    emit(const _Uploading());
    final result = await deleteFileUseCase(url);
    result.when((_) {
      emit(const _Deleted());
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> getFileUrl(String url) async {
    emit(const _Uploading());
    // TODO: fix this
    final result = await getFileUrlUseCase(
        UploadsPresignedUrlReq(originalName: '', size: 0, mimeType: ''));
    result.when((url) {
      emit(_Uploaded([url.url]));
    }, (error) {
      emit(_Error(error));
    });
  }

  final UploadUseCase uploadUseCase;
  final DeleteFileUseCase deleteFileUseCase;
  final GetFileUrlUseCase getFileUrlUseCase;

  static UploadFilesCubit get instance => getIt<UploadFilesCubit>();
}
