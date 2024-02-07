part of 'collections_cubit.dart';

@freezed
class CollectionsState with _$CollectionsState {
  const factory CollectionsState.initial() = _Initial;
  const factory CollectionsState.loading() = _Loading;
  const factory CollectionsState.collections(List<ProductCollection> collections, int count) = _Collections;
  const factory CollectionsState.error(Failure failure) = _Error;
}
