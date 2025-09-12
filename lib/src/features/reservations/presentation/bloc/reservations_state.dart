part of 'reservations_bloc.dart';

@freezed
class ReservationsState with _$ReservationsState {
  const factory ReservationsState.initial() = _Initial;
  const factory ReservationsState.loading() = _Loading;
  const factory ReservationsState.loaded() = _Loaded;
  const factory ReservationsState.error(MedusaError failure) = _Error;
}