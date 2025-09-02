part of 'return_reasons_crud_bloc.dart';

@freezed
class ReturnReasonsCrudEvent with _$ReturnReasonsCrudEvent {
  const factory ReturnReasonsCrudEvent.load(String id) = _Load;
  const factory ReturnReasonsCrudEvent.delete(String id) = _Delete;
  const factory ReturnReasonsCrudEvent.create(
      CreateReturnReason createReturnReason) = _Create;
  const factory ReturnReasonsCrudEvent.update(
      String id, UpdateReturnReason updateReturnReason) = _Update;
  const factory ReturnReasonsCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
