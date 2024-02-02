part of 'gift_card_crud_bloc.dart';

@freezed
class GiftCardCrudState with _$GiftCardCrudState {
  const factory GiftCardCrudState.initial() = _Initial;
  const factory GiftCardCrudState.loading({String? id}) = _Loading;
  const factory GiftCardCrudState.giftCard(GiftCard giftCard) = _GiftCard;
  const factory GiftCardCrudState.error(Failure failure) = _Error;
  const factory GiftCardCrudState.deleted() = _Deleted;
}
