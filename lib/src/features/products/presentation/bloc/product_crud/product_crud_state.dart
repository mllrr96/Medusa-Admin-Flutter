part of 'product_crud_bloc.dart';

@freezed
class ProductCrudState with _$ProductCrudState {
  const factory ProductCrudState.initial() = _Initial;
  const factory ProductCrudState.loading({String? id}) = _Loading;
  const factory ProductCrudState.product(Product product) = _Product;
  const factory ProductCrudState.products(List<Product> products, int count) =
      _Products;
  const factory ProductCrudState.productVariants(
      List<ProductVariant> variants) = _ProductVariants;
  const factory ProductCrudState.updated(Product product) = _Updated;
  const factory ProductCrudState.deleted() = _Deleted;
  const factory ProductCrudState.error(MedusaError failure) = _Error;
}
