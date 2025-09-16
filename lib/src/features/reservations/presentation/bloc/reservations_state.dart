part of 'reservations_bloc.dart';

@freezed
class ReservationsState with _$ReservationsState {
  const factory ReservationsState.initial() = _Initial;
  const factory ReservationsState.loading() = _Loading;
  const factory ReservationsState.reservationsList(ReservationsListResponse reservations) = _ReservationsList;
  const factory ReservationsState.reservation(ReservationResponse reservation) = _Reservation;
  const factory ReservationsState.deleted() = _Deleted;
  const factory ReservationsState.error(MedusaError failure) = _Error;
}
