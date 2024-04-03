part of 'discount_crud_bloc.dart';

@freezed
class DiscountCrudState with _$DiscountCrudState {
  const factory DiscountCrudState.initial() = _Initial;
  const factory DiscountCrudState.loading({String? discountId}) = _Loading;
  const factory DiscountCrudState.discount(Discount discount) = _Discount;
  const factory DiscountCrudState.discounts(List<Discount> discounts, int count) = _Discounts;
  const factory DiscountCrudState.error(Failure failure) = _Error;
  const factory DiscountCrudState.deleted() = _Deleted;
}
