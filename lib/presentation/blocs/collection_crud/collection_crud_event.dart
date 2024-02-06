part of 'collection_crud_bloc.dart';

@freezed
class CollectionCrudEvent with _$CollectionCrudEvent {
  const factory CollectionCrudEvent.load(String id,
      {Map<String, dynamic>? queryParameters}) = _Load;
  const factory CollectionCrudEvent.delete(String id) = _Delete;
  const factory CollectionCrudEvent.removeProducts(
      UserCollectionRemoveProductsReq userCollectionRemoveProductsReq) =
      _RemoveProducts;
  const factory CollectionCrudEvent.addProducts(
      UserCollectionUpdateProductsReq userCollectionUpdateProductsReq) =
      _AddProducts;
}
