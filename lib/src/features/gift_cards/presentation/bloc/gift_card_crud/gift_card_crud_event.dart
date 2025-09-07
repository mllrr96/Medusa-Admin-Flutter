part of 'gift_card_crud_bloc.dart';

@freezed
class GiftCardCrudEvent with _$GiftCardCrudEvent {
  const factory GiftCardCrudEvent.load(String id) = _Load;
  const factory GiftCardCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory GiftCardCrudEvent.update(
      String id, UpdateGiftCardRequest updateGiftCardReq) = _Update;
  const factory GiftCardCrudEvent.create(
      CreateGiftCardRequest createGiftCardReq) = _Create;
  const factory GiftCardCrudEvent.delete(String id) = _Delete;
}
