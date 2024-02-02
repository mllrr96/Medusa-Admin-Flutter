part of 'gift_cards_cubit.dart';

@freezed
class GiftCardsState with _$GiftCardsState {
  const factory GiftCardsState.initial() = _Initial;
  const factory GiftCardsState.loading() = _Loading;
  const factory GiftCardsState.giftCards(List<GiftCard> giftCards, int count) = _GiftCards;
  const factory GiftCardsState.error(Failure failure) = _Error;
}
