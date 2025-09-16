import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/tax_settings/domain/usecases/tax_rate/tax_settings_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'tax_crud_event.dart';
part 'tax_crud_state.dart';
part 'tax_crud_bloc.freezed.dart';

@injectable
class TaxCrudBloc extends Bloc<TaxCrudEvent, TaxCrudState> {
  TaxCrudBloc(TaxSettingsCrudUseCase taxSettingsCrudUseCase)
      : _useCase = taxSettingsCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Delete>(_delete);
    on<_Update>(_update);
    on<_LoadAll>(_loadAll);
  }

  void _load(_Load event, Emitter<TaxCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.fetch(event.id);
    result.when(
      (taxRate) => emit(_TaxRate(taxRate)),
      (error) => emit(_Error(error)),
    );
  }

  void _create(_Create event, Emitter<TaxCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.payload);
    result.when(
      (taxRate) => emit(_TaxRate(taxRate)),
      (error) => emit(_Error(error)),
    );
  }

  void _delete(_Delete event, Emitter<TaxCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
      (_) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  void _update(_Update event, Emitter<TaxCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.update(id: event.id, taxRateUpdateReq: event.payload);
    result.when(
      (taxRate) => emit(_TaxRate(taxRate)),
      (error) => emit(_Error(error)),
    );
  }

  void _loadAll(_LoadAll event, Emitter<TaxCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.fetchAll(queryParameters: {
      'limit': pageSize,
      ...?event.queryParameters,
    });
    result.when(
      (taxRates) => emit(_TaxRates(taxRates.taxRates, taxRates.count)),
      (error) => emit(_Error(error)),
    );
  }

  final TaxSettingsCrudUseCase _useCase;
  static int pageSize = 20;
  static TaxCrudBloc get instance => getIt<TaxCrudBloc>();
}
