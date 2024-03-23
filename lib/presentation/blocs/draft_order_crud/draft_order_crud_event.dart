part of 'draft_order_crud_bloc.dart';

@freezed
class DraftOrderCrudEvent with _$DraftOrderCrudEvent {
  const factory DraftOrderCrudEvent.load(String id,
      {Map<String, dynamic>? queryParameters}) = _Load;
  const factory DraftOrderCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory DraftOrderCrudEvent.delete(String id) = _Delete;
  const factory DraftOrderCrudEvent.create(
      UserCreateDraftOrderReq userCreateDraftOrderReq) = _Create;
  const factory DraftOrderCrudEvent.update(
      String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq) = _Update;
  const factory DraftOrderCrudEvent.registerPayment(
      String id) = _RegisterPayment;
}
