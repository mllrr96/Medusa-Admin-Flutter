import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';
part 'inventory_bloc.freezed.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc() : super(const _Initial()) {
    on<_Load>(_load);
  }

  Future<void> _load(
    _Load event,
    Emitter<InventoryState> emit,
  ) async {
    emit(const _Loading());
    // TODO: Implement data loading
    emit(const _Loaded());
  }
}