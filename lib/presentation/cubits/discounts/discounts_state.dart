part of 'discounts_cubit.dart';

@freezed
class DiscountsState with _$DiscountsState {
  const factory DiscountsState.initial() = _Initial;
  const factory DiscountsState.loading() = _Loading;
  const factory DiscountsState.discounts(List<Discount> discounts, int count) = _Discounts;
  const factory DiscountsState.error(Failure failure) = _Error;
}
