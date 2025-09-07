part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.started() = _Started;
  const factory StoreEvent.loadStore(String id) = _LoadStore;
  const factory StoreEvent.loadStores(
    Map<String, dynamic>? query,
  ) = _LoadStores;
  const factory StoreEvent.updateStore(String id, UpdateStoreReq storePostReq) =
      _UpdateStore;
}
