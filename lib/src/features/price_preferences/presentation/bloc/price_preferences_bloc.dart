
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/price_preferences/domain/usecases/create_price_preference_use_case.dart';
import 'package:medusa_admin/src/features/price_preferences/domain/usecases/delete_price_preference_use_case.dart';
import 'package:medusa_admin/src/features/price_preferences/domain/usecases/list_price_preferences_use_case.dart';
import 'package:medusa_admin/src/features/price_preferences/domain/usecases/retrieve_price_preference_use_case.dart';
import 'package:medusa_admin/src/features/price_preferences/domain/usecases/update_price_preference_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'price_preferences_event.dart';
part 'price_preferences_state.dart';
part 'price_preferences_bloc.freezed.dart';

@injectable
class PricePreferencesBloc extends Bloc<PricePreferencesEvent, PricePreferencesState> {
  PricePreferencesBloc(
    this._listPricePreferencesUseCase,
    this._createPricePreferenceUseCase,
    this._deletePricePreferenceUseCase,
    this._retrievePricePreferenceUseCase,
    this._updatePricePreferenceUseCase,
  ) : super(const _Initial()) {
    on<_LoadPricePreference>(_loadPricePreference);
    on<_CreatePricePreference>(_createPricePreference);
    on<_DeletePricePreference>(_deletePricePreference);
    on<_RetrievePricePreference>(_retrievePricePreference);
    on<_UpdatePricePreference>(_updatePricePreference);
  }

  final ListPricePreferencesUseCase _listPricePreferencesUseCase;
  final CreatePricePreferenceUseCase _createPricePreferenceUseCase;
  final DeletePricePreferenceUseCase _deletePricePreferenceUseCase;
  final RetrievePricePreferenceUseCase _retrievePricePreferenceUseCase;
  final UpdatePricePreferenceUseCase _updatePricePreferenceUseCase;

  Future<void> _loadPricePreference(
    _LoadPricePreference event,
    Emitter<PricePreferencesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listPricePreferencesUseCase();
    result.when(
      (pricePreferences) => emit(_PricePreferences(pricePreferences)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createPricePreference(
    _CreatePricePreference event,
    Emitter<PricePreferencesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createPricePreferenceUseCase(event.payload);
    result.when(
      (pricePreference) => emit(_PricePreference(pricePreference)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deletePricePreference(
    _DeletePricePreference event,
    Emitter<PricePreferencesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deletePricePreferenceUseCase(event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrievePricePreference(
    _RetrievePricePreference event,
    Emitter<PricePreferencesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrievePricePreferenceUseCase(event.id);
    result.when(
      (pricePreference) => emit(_PricePreference(pricePreference)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updatePricePreference(
    _UpdatePricePreference event,
    Emitter<PricePreferencesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updatePricePreferenceUseCase(id: event.id, body: event.payload);
    result.when(
      (pricePreference) => emit(_PricePreference(pricePreference)),
      (error) => emit(_Error(error)),
    );
  }
}
