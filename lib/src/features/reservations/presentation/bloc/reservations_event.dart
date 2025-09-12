part of 'reservations_bloc.dart';

@freezed
class ReservationsEvent with _$ReservationsEvent {
  const factory ReservationsEvent.load() = _Load;
}