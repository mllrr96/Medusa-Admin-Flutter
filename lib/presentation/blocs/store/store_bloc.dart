import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/store/load_store_use_case.dart';
import 'package:medusa_admin/domain/use_case/store/update_store_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart' as medusa;

part 'store_event.dart';
part 'store_state.dart';
part 'store_bloc.freezed.dart';

@injectable
class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc(this.loadStoreUseCase, this.updateStoreUseCase)
      : super(const _Initial()) {
    on<_LoadStore>(_loadStore);
    on<_UpdateStore>(_updateStore);
    add(const _LoadStore());
  }

  Future<void> _loadStore(
    _LoadStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(const _Loading());
    final result = await loadStoreUseCase();
    result.when(
        (store) => emit(_Loaded(store)), (error) => emit(_Error(error)));
  }

  Future<void> _updateStore(
    _UpdateStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(const _Loading());
    final result = await updateStoreUseCase(event.storePostReq);
    result.when(
        (store) => emit(_Loaded(store)), (error) => emit(_Error(error)));
  }

  final LoadStoreUseCase loadStoreUseCase;
  final UpdateStoreUseCase updateStoreUseCase;
  static StoreBloc get instance => getIt<StoreBloc>();
}
