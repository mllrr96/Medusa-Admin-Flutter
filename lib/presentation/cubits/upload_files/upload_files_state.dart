part of 'upload_files_cubit.dart';

@freezed
class UploadFilesState with _$UploadFilesState {
  const factory UploadFilesState.initial() = _Initial;
  const factory UploadFilesState.uploading() = _Uploading;
  const factory UploadFilesState.deleted() = _Deleted;
  const factory UploadFilesState.uploaded(List<String> urls) = _Uploaded;
  const factory UploadFilesState.error(Failure failure) = _Error;
}
