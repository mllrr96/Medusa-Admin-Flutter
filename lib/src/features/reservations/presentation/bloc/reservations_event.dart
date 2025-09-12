part of 'reservations_bloc.dart';

@freezed
class ReservationsEvent with _$ReservationsEvent {
  const factory ReservationsEvent.load() = _Load;
  const factory ReservationsEvent.createReservation(CreateReservationReq payload) = _CreateReservation;
  const factory ReservationsEvent.deleteReservation(String id) = _DeleteReservation;
  const factory ReservationsEvent.retrieveReservation(String id) = _RetrieveReservation;
  const factory ReservationsEvent.updateReservation(String id, UpdateReservationReq payload) = _UpdateReservation;
}
