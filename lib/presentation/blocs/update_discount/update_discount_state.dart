part of 'update_discount_bloc.dart';

@freezed
class UpdateDiscountState with _$UpdateDiscountState {
  const factory UpdateDiscountState.initial() = _Initial;
  const factory UpdateDiscountState.loading(String discountId) = _Loading;
  const factory UpdateDiscountState.success(Discount? discount) = _Success;
  const factory UpdateDiscountState.error(Failure failure) = _Error;
}
