part of 'discount_details_cubit.dart';

@freezed
class DiscountDetailsState with _$DiscountDetailsState {
  const factory DiscountDetailsState.initial() = _Initial;
  const factory DiscountDetailsState.loading() = _Loading;
  const factory DiscountDetailsState.discount(Discount discount) = _Discount;
  const factory DiscountDetailsState.error(Failure failure) = _Error;
}
