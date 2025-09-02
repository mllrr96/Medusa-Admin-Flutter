part of 'product_crud_bloc.dart';

@freezed
class ProductCrudEvent with _$ProductCrudEvent {
  const factory ProductCrudEvent.load(String id) = _Load;
  const factory ProductCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory ProductCrudEvent.loadProductVariants(String id) = _LoadProductVariants;
  const factory ProductCrudEvent.delete(String id) = _Delete;
  const factory ProductCrudEvent.update(String id, UpdateProductReq payload) = _Update;
  const factory ProductCrudEvent.create(CreateProductReq payload) = _Create;
}
