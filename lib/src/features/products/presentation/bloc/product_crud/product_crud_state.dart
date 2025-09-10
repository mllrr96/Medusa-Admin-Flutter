part of 'product_crud_bloc.dart';

@freezed
class ProductCrudState with _$ProductCrudState {
  const factory ProductCrudState.initial() = _Initial;
  const factory ProductCrudState.loading({String? id}) = ProductCrudLoading;
  const factory ProductCrudState.product(Product product) = ProductCrudProduct;
  const factory ProductCrudState.products(List<Product> products, int count) =
  ProductCrudProducts;
  const factory ProductCrudState.productVariants(
      List<ProductVariant> variants) = ProductCrudProductVariants;
  const factory ProductCrudState.updated(Product product) = ProductCrudUpdated;
  const factory ProductCrudState.deleted() = ProductCrudDeleted;
  const factory ProductCrudState.error(MedusaError failure) = ProductCrudError;
}
