part of 'collection_crud_bloc.dart';

@freezed
class CollectionCrudState with _$CollectionCrudState {
  const factory CollectionCrudState.initial() = _Initial;
  const factory CollectionCrudState.loading() = _Loading;
  const factory CollectionCrudState.collection(ProductCollection collection) = _Collection;
  const factory CollectionCrudState.collections(List<ProductCollection> collections, int count) = _Collections;
  const factory CollectionCrudState.error(Failure failure) = _Error;
  const factory CollectionCrudState.deleted() = _Deleted;
  const factory CollectionCrudState.productsRemoved(List<String> ids) = _ProductsRemoved;
}
