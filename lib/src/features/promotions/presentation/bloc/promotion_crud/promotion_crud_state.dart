part of 'promotion_crud_bloc.dart';

@freezed
class PromotionCrudState with _$PromotionCrudState {
  const factory PromotionCrudState.initial() = _Initial;
  const factory PromotionCrudState.loading({String? discountId}) = _Loading;
  const factory PromotionCrudState.discount(Promotion discount) = _Discount;
  const factory PromotionCrudState.discounts(
      List<Promotion> discounts, int count) = _Discounts;
  const factory PromotionCrudState.error(MedusaError failure) = _Error;
  const factory PromotionCrudState.deleted() = _Deleted;
}
