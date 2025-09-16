import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/batch_inventory_items_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/batch_location_levels_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/create_inventory_item_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/create_location_level_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/delete_inventory_item_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/delete_location_level_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/list_inventory_items_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/list_location_levels_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/retrieve_inventory_item_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/update_inventory_item_use_case.dart';
import 'package:medusa_admin/src/features/inventory/domain/usecases/update_location_level_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'inventory_event.dart';

part 'inventory_state.dart';

part 'inventory_bloc.freezed.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc(
    this._listInventoryItemsUseCase,
    this._createInventoryItemUseCase,
    this._batchInventoryItemsUseCase,
    this._retrieveInventoryItemUseCase,
    this._updateInventoryItemUseCase,
    this._deleteInventoryItemUseCase,
    this._listLocationLevelsUseCase,
    this._createLocationLevelUseCase,
    this._batchLocationLevelsUseCase,
    this._deleteLocationLevelUseCase,
    this._updateLocationLevelUseCase,
  ) : super(const _Initial()) {
    on<_LoadInventoryItems>(_loadInventoryItems);
    on<_CreateInventoryItem>(_createInventoryItem);
    on<_BatchInventoryItems>(_batchInventoryItems);
    on<_RetrieveInventoryItem>(_retrieveInventoryItem);
    on<_UpdateInventoryItem>(_updateInventoryItem);
    on<_DeleteInventoryItem>(_deleteInventoryItem);
    on<_ListLocationLevels>(_listLocationLevels);
    on<_CreateLocationLevel>(_createLocationLevel);
    on<_BatchLocationLevels>(_batchLocationLevels);
    on<_DeleteLocationLevel>(_deleteLocationLevel);
    on<_UpdateLocationLevel>(_updateLocationLevel);
  }

  final ListInventoryItemsUseCase _listInventoryItemsUseCase;
  final CreateInventoryItemUseCase _createInventoryItemUseCase;
  final BatchInventoryItemsUseCase _batchInventoryItemsUseCase;
  final RetrieveInventoryItemUseCase _retrieveInventoryItemUseCase;
  final UpdateInventoryItemUseCase _updateInventoryItemUseCase;
  final DeleteInventoryItemUseCase _deleteInventoryItemUseCase;
  final ListLocationLevelsUseCase _listLocationLevelsUseCase;
  final CreateLocationLevelUseCase _createLocationLevelUseCase;
  final BatchLocationLevelsUseCase _batchLocationLevelsUseCase;
  final DeleteLocationLevelUseCase _deleteLocationLevelUseCase;
  final UpdateLocationLevelUseCase _updateLocationLevelUseCase;

  Future<void> _loadInventoryItems(
    _LoadInventoryItems event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listInventoryItemsUseCase(queryParameters: event.query);
    result.when(
      (inventoryItems) => emit(_InventoryItemsList(inventoryItems)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createInventoryItem(
    _CreateInventoryItem event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createInventoryItemUseCase(event.body);
    result.when(
      (inventoryItem) => emit(_InventoryItem(inventoryItem)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _batchInventoryItems(
    _BatchInventoryItems event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _batchInventoryItemsUseCase(event.body);
    result.when(
      (batchInventoryItems) => emit(_BatchInventoryItemsRes(batchInventoryItems)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrieveInventoryItem(
    _RetrieveInventoryItem event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveInventoryItemUseCase(event.id);
    result.when(
      (inventoryItem) => emit(_InventoryItem(inventoryItem)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updateInventoryItem(
    _UpdateInventoryItem event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateInventoryItemUseCase(event.id, event.body);
    result.when(
      (inventoryItem) => emit(_InventoryItem(inventoryItem)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deleteInventoryItem(
    _DeleteInventoryItem event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteInventoryItemUseCase(event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _listLocationLevels(
    _ListLocationLevels event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listLocationLevelsUseCase(event.id);
    result.when(
      (inventoryItems) => emit(_InventoryItemsList(inventoryItems)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createLocationLevel(
    _CreateLocationLevel event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createLocationLevelUseCase(event.id, event.body);
    result.when(
      (inventoryItem) => emit(_InventoryItem(inventoryItem)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _batchLocationLevels(
    _BatchLocationLevels event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _batchLocationLevelsUseCase(event.id, event.body);
    result.when(
      (unit) => emit(const _Initial()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deleteLocationLevel(
    _DeleteLocationLevel event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteLocationLevelUseCase(event.id, event.locationId);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updateLocationLevel(
    _UpdateLocationLevel event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateLocationLevelUseCase(event.id, event.locationId, event.body);
    result.when(
      (inventoryItem) => emit(_InventoryItem(inventoryItem)),
      (error) => emit(_Error(error)),
    );
  }

  static InventoryBloc get instance => getIt<InventoryBloc>();
}
