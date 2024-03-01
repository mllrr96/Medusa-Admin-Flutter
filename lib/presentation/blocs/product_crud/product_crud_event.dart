part of 'product_crud_bloc.dart';

@freezed
class ProductCrudEvent with _$ProductCrudEvent {
  const factory ProductCrudEvent.load(String id) = _Load;
  const factory ProductCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory ProductCrudEvent.loadWithVariants(String id) = _LoadWithVariants;
  const factory ProductCrudEvent.delete(String id) = _Delete;
  const factory ProductCrudEvent.update(String id,UserPostUpdateProductReq userPostUpdateProductReq) = _Update;
  const factory ProductCrudEvent.create(UserPostProductReq userPostProductReq) = _Create;
}
