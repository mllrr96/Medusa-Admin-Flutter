import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/stock_locations/domain/usecases/create_stock_location_use_case.dart';
import 'package:medusa_admin/src/features/stock_locations/domain/usecases/delete_stock_location_use_case.dart';
import 'package:medusa_admin/src/features/stock_locations/domain/usecases/list_stock_locations_use_case.dart';
import 'package:medusa_admin/src/features/stock_locations/domain/usecases/retrieve_stock_location_use_case.dart';
import 'package:medusa_admin/src/features/stock_locations/domain/usecases/update_stock_location_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'stock_locations_event.dart';
part 'stock_locations_state.dart';
part 'stock_locations_bloc.freezed.dart';

@injectable
class StockLocationsBloc extends Bloc<StockLocationsEvent, StockLocationsState> {
  StockLocationsBloc(
    this._listStockLocationsUseCase,
    this._createStockLocationUseCase,
    this._retrieveStockLocationUseCase,
    this._updateStockLocationUseCase,
    this._deleteStockLocationUseCase,
  ) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Retrieve>(_retrieve);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  final ListStockLocationsUseCase _listStockLocationsUseCase;
  final CreateStockLocationUseCase _createStockLocationUseCase;
  final RetrieveStockLocationUseCase _retrieveStockLocationUseCase;
  final UpdateStockLocationUseCase _updateStockLocationUseCase;
  final DeleteStockLocationUseCase _deleteStockLocationUseCase;

  Future<void> _load(
    _Load event,
    Emitter<StockLocationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listStockLocationsUseCase();
    result.when(
      (stockLocations) => emit(_StockLocations(stockLocations)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(
    _Create event,
    Emitter<StockLocationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createStockLocationUseCase(event.payload);
    result.when(
      (stockLocation) => emit(_StockLocation(stockLocation)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrieve(
    _Retrieve event,
    Emitter<StockLocationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveStockLocationUseCase(event.id);
    result.when(
      (stockLocation) => emit(_StockLocation(stockLocation)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _update(
    _Update event,
    Emitter<StockLocationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateStockLocationUseCase(event.id, event.payload);
    result.when(
      (stockLocation) => emit(_StockLocation(stockLocation)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(
    _Delete event,
    Emitter<StockLocationsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteStockLocationUseCase(event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  static StockLocationsBloc get instance => getIt<StockLocationsBloc>();
  static const int pageSize = 20;
}
