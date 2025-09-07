import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/store_settings/domain/usecases/store/load_store_use_case.dart';
import 'package:medusa_admin/src/features/store_settings/domain/usecases/store/load_stores_use_case.dart';
import 'package:medusa_admin/src/features/store_settings/domain/usecases/store/update_store_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'store_event.dart';

part 'store_state.dart';

part 'store_bloc.freezed.dart';

@injectable
class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc(
      this.loadStoreUseCase, this.updateStoreUseCase, this.loadStoresUseCase)
      : super(const _Initial()) {
    on<_LoadStore>(_loadStore);
    on<_LoadStores>(_loadStores);
    on<_UpdateStore>(_updateStore);
  }

  Future<void> _loadStore(
    _LoadStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(const _Loading());
    final result = await loadStoreUseCase(event.id);
    result.when((store) => emit(_Store(store)), (error) => emit(_Error(error)));
  }

  Future<void> _loadStores(
    _LoadStores event,
    Emitter<StoreState> emit,
  ) async {
    emit(const _Loading());
    final result = await loadStoresUseCase(event.query);
    result.when(
        (store) => emit(_Stores(store)), (error) => emit(_Error(error)));
  }

  Future<void> _updateStore(
    _UpdateStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(const _Loading());
    final result = await updateStoreUseCase(event.id, event.storePostReq);
    result.when((store) => emit(_Store(store)), (error) => emit(_Error(error)));
  }

  final LoadStoreUseCase loadStoreUseCase;
  final LoadStoresUseCase loadStoresUseCase;
  final UpdateStoreUseCase updateStoreUseCase;

  static StoreBloc get instance => getIt<StoreBloc>();
}
