import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/file/delete_file_use_case.dart';
import 'package:medusa_admin/domain/use_case/file/get_file_url_use_case.dart';
import 'package:medusa_admin/domain/use_case/file/upload_use_case.dart';

part 'upload_files_state.dart';
part 'upload_files_cubit.freezed.dart';

@injectable
class UploadFilesCubit extends Cubit<UploadFilesState> {
  UploadFilesCubit(
      this.uploadUseCase, this.deleteFileUseCase, this.getFileUrlUseCase)
      : super(const _Initial());

  Future<void> uploadFiles(List<File> files) async {
    emit(const _Uploading());
    final result = await uploadUseCase(files);
    result.when((urls) {
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
    final result = await getFileUrlUseCase(url);
    result.when((url) {
      emit(_Uploaded([url]));
    }, (error) {
      emit(_Error(error));
    });
  }

  final UploadUseCase uploadUseCase;
  final DeleteFileUseCase deleteFileUseCase;
  final GetFileUrlUseCase getFileUrlUseCase;
  static UploadFilesCubit get instance => getIt<UploadFilesCubit>();
}
