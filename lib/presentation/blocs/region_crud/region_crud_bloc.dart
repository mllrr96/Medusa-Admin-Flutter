import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/region/regions_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'region_crud_event.dart';
part 'region_crud_state.dart';
part 'region_crud_bloc.freezed.dart';

@injectable
class RegionCrudBloc extends Bloc<RegionCrudEvent, RegionCrudState> {
  RegionCrudBloc(RegionCrudUseCase regionCrudUseCase)
      : _useCase = regionCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
    on<_AddCountry>(_addCountry);
    on<_RemoveCountry>(_removeCountry);
    on<_LoadFulfillmentOptions>(_loadFulfillmentOptions);
    on<_AddFulfillmentProvider>(_addFulfillmentProvider);
    on<_RemoveFulfillmentProvider>(_removeFulfillmentProvider);
    on<_AddPaymentProvider>(_addPaymentProvider);
    on<_RemovePaymentProvider>(_removePaymentProvider);
  }

  Future<void> _load(_Load event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(_LoadAll event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(queryParameters: {
      'limit': pageSize,
      ...?event.queryParameters,
    });
    result.when(
        (regions) => emit(_Regions(regions.regions ?? [], regions.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _create(_Create event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.userCreateRegionReq);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _update(_Update event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(
        id: event.id, userUpdateRegionReq: event.userUpdateRegionReq);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _delete(_Delete event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
        (unit) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _addCountry(
      _AddCountry event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.addCountry(id: event.id, countryCode: event.countryCode);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _removeCountry(
      _RemoveCountry event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.removeCountry(
        id: event.id, countryCode: event.countryCode);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _loadFulfillmentOptions(
      _LoadFulfillmentOptions event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadFulfillmentOptions(event.id);
    result.when(
        (fulfillmentOptions) => emit(_FulfillmentOptions(fulfillmentOptions)),
        (error) => emit(_Error(error)));
  }

  Future<void> _addFulfillmentProvider(
      _AddFulfillmentProvider event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.addFulfillmentProvider(
        id: event.id, providerId: event.providerId);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _removeFulfillmentProvider(
      _RemoveFulfillmentProvider event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.removeFulfillmentProvider(
        id: event.id, providerId: event.providerId);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _addPaymentProvider(
      _AddPaymentProvider event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.addPaymentProvider(
        id: event.id, providerId: event.providerId);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _removePaymentProvider(
      _RemovePaymentProvider event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.removePaymentProvider(
        id: event.id, providerId: event.providerId);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  final RegionCrudUseCase _useCase;
  static RegionCrudBloc get instance => getIt<RegionCrudBloc>();
  static int pageSize = 20;
}
