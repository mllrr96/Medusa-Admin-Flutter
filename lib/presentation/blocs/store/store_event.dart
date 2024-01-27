part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.started() = _Started;
  const factory StoreEvent.loadStore() = _LoadStore;
  const factory StoreEvent.updateStore(medusa.StorePostReq storePostReq) = _UpdateStore;
}
