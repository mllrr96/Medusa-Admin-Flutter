import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/reservations/domain/usecases/create_reservation_use_case.dart';
import 'package:medusa_admin/src/features/reservations/domain/usecases/delete_reservation_use_case.dart';
import 'package:medusa_admin/src/features/reservations/domain/usecases/list_reservations_use_case.dart';
import 'package:medusa_admin/src/features/reservations/domain/usecases/retrieve_reservation_use_case.dart';
import 'package:medusa_admin/src/features/reservations/domain/usecases/update_reservation_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';
part 'reservations_bloc.freezed.dart';

@injectable
class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc(
    this._listReservationsUseCase,
    this._createReservationUseCase,
    this._deleteReservationUseCase,
    this._retrieveReservationUseCase,
    this._updateReservationUseCase,
  ) : super(const _Initial()) {
    on<_Load>(_load);
    on<_CreateReservation>(_createReservation);
    on<_DeleteReservation>(_deleteReservation);
    on<_RetrieveReservation>(_retrieveReservation);
    on<_UpdateReservation>(_updateReservation);
  }

  final ListReservationsUseCase _listReservationsUseCase;
  final CreateReservationUseCase _createReservationUseCase;
  final DeleteReservationUseCase _deleteReservationUseCase;
  final RetrieveReservationUseCase _retrieveReservationUseCase;
  final UpdateReservationUseCase _updateReservationUseCase;

  Future<void> _load(
    _Load event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listReservationsUseCase();
    result.when(
      (reservations) => emit(_ReservationsList(reservations)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createReservation(
    _CreateReservation event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createReservationUseCase(payload: event.payload);
    result.when(
      (reservation) => emit(_Reservation(reservation)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deleteReservation(
    _DeleteReservation event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteReservationUseCase(id: event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrieveReservation(
    _RetrieveReservation event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveReservationUseCase(id: event.id);
    result.when(
      (reservation) => emit(_Reservation(reservation)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updateReservation(
    _UpdateReservation event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateReservationUseCase(id: event.id, payload: event.payload);
    result.when(
      (reservation) => emit(_Reservation(reservation)),
      (error) => emit(_Error(error)),
    );
  }
}
