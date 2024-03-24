part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.started() = _Started;
  const factory StoreEvent.loadStore() = _LoadStore;
  const factory StoreEvent.updateStore(StorePostReq storePostReq) = _UpdateStore;
}
