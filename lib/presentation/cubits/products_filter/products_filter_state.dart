part of 'products_filter_cubit.dart';

@freezed
class ProductsFilterState with _$ProductsFilterState {
  const factory ProductsFilterState.initial() = _Initial;
  const factory ProductsFilterState.loading() = _Loading;
  const factory ProductsFilterState.loaded(List<ProductCollection> collections, List<ProductTag> tags) = _Loaded;
  const factory ProductsFilterState.error(Failure failure) = _Error;
}
