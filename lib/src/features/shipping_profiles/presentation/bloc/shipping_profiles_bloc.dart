import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/shipping_profiles/domain/usecases/create_shipping_profile_use_case.dart';
import 'package:medusa_admin/src/features/shipping_profiles/domain/usecases/delete_shipping_profile_use_case.dart';
import 'package:medusa_admin/src/features/shipping_profiles/domain/usecases/list_shipping_profiles_use_case.dart';
import 'package:medusa_admin/src/features/shipping_profiles/domain/usecases/retrieve_shipping_profile_use_case.dart';
import 'package:medusa_admin/src/features/shipping_profiles/domain/usecases/update_shipping_profile_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'shipping_profiles_event.dart';
part 'shipping_profiles_state.dart';
part 'shipping_profiles_bloc.freezed.dart';

@injectable
class ShippingProfilesBloc extends Bloc<ShippingProfilesEvent, ShippingProfilesState> {
  ShippingProfilesBloc(
    this._listShippingProfilesUseCase,
    this._createShippingProfileUseCase,
    this._retrieveShippingProfileUseCase,
    this._updateShippingProfileUseCase,
    this._deleteShippingProfileUseCase,
  ) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Retrieve>(_retrieve);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  final ListShippingProfilesUseCase _listShippingProfilesUseCase;
  final CreateShippingProfileUseCase _createShippingProfileUseCase;
  final RetrieveShippingProfileUseCase _retrieveShippingProfileUseCase;
  final UpdateShippingProfileUseCase _updateShippingProfileUseCase;
  final DeleteShippingProfileUseCase _deleteShippingProfileUseCase;

  Future<void> _load(
    _Load event,
    Emitter<ShippingProfilesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listShippingProfilesUseCase();
    result.when(
      (profiles) => emit(_Profiles(profiles)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(
    _Create event,
    Emitter<ShippingProfilesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createShippingProfileUseCase(event.payload);
    result.when(
      (profile) => emit(_Profile(profile)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrieve(
    _Retrieve event,
    Emitter<ShippingProfilesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveShippingProfileUseCase(event.id);
    result.when(
      (profile) => emit(_Profile(profile)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _update(
    _Update event,
    Emitter<ShippingProfilesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateShippingProfileUseCase(event.id, event.payload);
    result.when(
      (profile) => emit(_Profile(profile)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(
    _Delete event,
    Emitter<ShippingProfilesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteShippingProfileUseCase(event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  static ShippingProfilesBloc get instance => getIt<ShippingProfilesBloc>();
  static const int pageSize = 20;
}