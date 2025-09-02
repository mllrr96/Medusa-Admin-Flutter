part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = _Loading;
  const factory StoreState.store(Store store) = _Store;
  const factory StoreState.stores(StoreListRes response) = _Stores;
  const factory StoreState.error(MedusaError e) = _Error;
}
