part of 'discount_condition_bloc.dart';

@freezed
class DiscountConditionState with _$DiscountConditionState {
  const factory DiscountConditionState.initial() = _Initial;
  const factory DiscountConditionState.loading() = _Loading;
  const factory DiscountConditionState.loaded(List<Object> items, int count) = _Loaded;
  const factory DiscountConditionState.error(Failure failure) = _Error;
}
