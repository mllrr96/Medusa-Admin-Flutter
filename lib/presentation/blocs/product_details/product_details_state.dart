part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.product(Product product) = _Product;
  const factory ProductDetailsState.updated(Product product) = _Updated;
  const factory ProductDetailsState.deleted() = _Deleted;
  const factory ProductDetailsState.error(Failure failure) = _Error;
}
