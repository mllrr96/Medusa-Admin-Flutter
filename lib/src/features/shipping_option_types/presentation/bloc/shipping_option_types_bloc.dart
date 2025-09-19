import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/shipping_option_types/domain/usecases/create_shipping_option_use_case.dart';
import 'package:medusa_admin/src/features/shipping_option_types/domain/usecases/delete_shipping_option_use_case.dart';
import 'package:medusa_admin/src/features/shipping_option_types/domain/usecases/list_shipping_options_use_case.dart';
import 'package:medusa_admin/src/features/shipping_option_types/domain/usecases/retrieve_shipping_option_use_case.dart';
import 'package:medusa_admin/src/features/shipping_option_types/domain/usecases/update_shipping_option_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'shipping_option_types_event.dart';

part 'shipping_option_types_state.dart';

part 'shipping_option_types_bloc.freezed.dart';

@injectable
class ShippingOptionTypesBloc extends Bloc<ShippingOptionTypesEvent, ShippingOptionTypesState> {
  ShippingOptionTypesBloc(
    this._listShippingOptionsUseCase,
    this._createShippingOptionUseCase,
    this._retrieveShippingOptionUseCase,
    this._updateShippingOptionUseCase,
    this._deleteShippingOptionUseCase,
  ) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Retrieve>(_retrieve);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  final ListShippingOptionTypesUseCase _listShippingOptionsUseCase;
  final CreateShippingOptionUseCase _createShippingOptionUseCase;
  final RetrieveShippingOptionUseCase _retrieveShippingOptionUseCase;
  final UpdateShippingOptionUseCase _updateShippingOptionUseCase;
  final DeleteShippingOptionUseCase _deleteShippingOptionUseCase;

  Future<void> _retrieve(
    _Retrieve event,
    Emitter<ShippingOptionTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveShippingOptionUseCase(event.id);
    result.when(
      (optionType) => emit(_Option(optionType)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _load(
    _Load event,
    Emitter<ShippingOptionTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listShippingOptionsUseCase(queryParameters: event.query);
    result.when(
      (optionTypes) => emit(_OptionTypes(optionTypes)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(
    _Create event,
    Emitter<ShippingOptionTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createShippingOptionUseCase(event.payload);
    result.when(
      (option) => emit(_Option(option)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _update(
    _Update event,
    Emitter<ShippingOptionTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateShippingOptionUseCase(event.id, event.payload);
    result.when(
      (option) => emit(_Option(option)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(
    _Delete event,
    Emitter<ShippingOptionTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteShippingOptionUseCase(event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  static ShippingOptionTypesBloc get instance => getIt<ShippingOptionTypesBloc>();
}
