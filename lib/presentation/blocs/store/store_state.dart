part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = _Loading;
  const factory StoreState.loaded(Store store) = _Loaded;
  const factory StoreState.error(Failure failure) = _Error;
}
