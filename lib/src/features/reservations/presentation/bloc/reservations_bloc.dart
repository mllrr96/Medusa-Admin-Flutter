import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';
part 'reservations_bloc.freezed.dart';

@injectable
class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc() : super(const _Initial()) {
    on<_Load>(_load);
  }

  Future<void> _load(
    _Load event,
    Emitter<ReservationsState> emit,
  ) async {
    emit(const _Loading());
    // TODO: Implement data loading
    emit(const _Loaded());
  }
}