part of 'pricing_crud_bloc.dart';

@freezed
class PricingCrudState with _$PricingCrudState {
  const factory PricingCrudState.initial() = _Initial;
  const factory PricingCrudState.loading() = _Loading;
  const factory PricingCrudState.deleted() = _Deleted;
  const factory PricingCrudState.pricingList(PriceList priceList) = _PricingList;
  const factory PricingCrudState.pricingLists(List<PriceList> priceLists, int count) = _PricingLists;
  const factory PricingCrudState.products(List<Product> products, int count) = _Products;
  const factory PricingCrudState.error(Failure failure) = _Error;
}
