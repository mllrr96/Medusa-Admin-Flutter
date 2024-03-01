import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/region/regions_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'region_crud_event.dart';
part 'region_crud_state.dart';
part 'region_crud_bloc.freezed.dart';

@injectable
class RegionCrudBloc extends Bloc<RegionCrudEvent, RegionCrudState> {
  RegionCrudBloc(RegionCrudUseCase regionCrudUseCase)
      : _regionCrudUseCase = regionCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  Future<void> _load(_Load event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _regionCrudUseCase.load(event.id);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(_LoadAll event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _regionCrudUseCase.loadAll(queryParameters: {
      'limit': pageSize,
      ...?event.queryParameters,
    });
    result.when(
        (regions) => emit(_Regions(regions.regions ?? [], regions.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _create(_Create event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _regionCrudUseCase.create(event.userCreateRegionReq);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _update(_Update event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _regionCrudUseCase.update(
        id: event.id, userUpdateRegionReq: event.userUpdateRegionReq);
    result.when(
        (region) => emit(_Region(region)), (error) => emit(_Error(error)));
  }

  Future<void> _delete(_Delete event, Emitter<RegionCrudState> emit) async {
    emit(const _Loading());
    final result = await _regionCrudUseCase.delete(event.id);
    result.when(
        (unit) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  final RegionCrudUseCase _regionCrudUseCase;
  static RegionCrudBloc get instance => getIt<RegionCrudBloc>();
  static int pageSize = 20;
}
