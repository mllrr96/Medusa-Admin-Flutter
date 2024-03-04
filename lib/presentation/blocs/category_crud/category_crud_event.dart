part of 'category_crud_bloc.dart';

@freezed
class CategoryCrudEvent with _$CategoryCrudEvent {
  const factory CategoryCrudEvent.load(String id,
      {Map<String, dynamic>? queryParameters}) = _Load;
  const factory CategoryCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory CategoryCrudEvent.create(
      UserCreateProductCategoryReq userCreateProductCategoryReq) = _Create;
  const factory CategoryCrudEvent.update(String id,
      UserUpdateProductCategoryReq userUpdateProductCategoryReq) = _Update;
  const factory CategoryCrudEvent.delete(String id) = _Delete;
  const factory CategoryCrudEvent.addProducts(
      String id, List<String> productIds) = _AddProducts;
  const factory CategoryCrudEvent.removeProducts(
      String id, List<String> productIds) = _RemoveProducts;
}
