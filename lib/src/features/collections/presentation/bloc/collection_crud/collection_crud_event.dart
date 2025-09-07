part of 'collection_crud_bloc.dart';

@freezed
class CollectionCrudEvent with _$CollectionCrudEvent {
  const factory CollectionCrudEvent.load(String id,
      {Map<String, dynamic>? queryParameters}) = _Load;

  const factory CollectionCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;

  const factory CollectionCrudEvent.delete(String id) = _Delete;

  const factory CollectionCrudEvent.create(CreateCollectionReq payload) =
      _Create;

  const factory CollectionCrudEvent.update(
      String id, UpdateCollectionReq payload) = _Update;

  const factory CollectionCrudEvent.removeProducts(
      String id, List<String> productIds) = _RemoveProducts;

  const factory CollectionCrudEvent.addProducts(
      String id, List<String> productIds) = _AddProducts;
}
