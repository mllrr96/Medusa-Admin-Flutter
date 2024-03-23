part of 'return_reasons_crud_bloc.dart';

@freezed
class ReturnReasonsCrudState with _$ReturnReasonsCrudState {
  const factory ReturnReasonsCrudState.initial() = _Initial;
  const factory ReturnReasonsCrudState.loading() = _Loading;
  const factory ReturnReasonsCrudState.returnReason(ReturnReason returnReason) = _ReturnReason;
  const factory ReturnReasonsCrudState.returnReasons(List<ReturnReason> returnReasons, int count) = _ReturnReasons;
  const factory ReturnReasonsCrudState.deleted() = _Deleted;
  const factory ReturnReasonsCrudState.error(Failure failure) = _Error;
}
