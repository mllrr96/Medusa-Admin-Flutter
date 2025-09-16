part of 'promotion_condition_bloc.dart';

@freezed
class PromotionConditionState with _$PromotionConditionState {
  const factory PromotionConditionState.initial() = _Initial;
  const factory PromotionConditionState.loading() = _Loading;
  const factory PromotionConditionState.loaded(List<Object> items, int count) =
      _Loaded;
  const factory PromotionConditionState.error(MedusaError failure) = _Error;
}
