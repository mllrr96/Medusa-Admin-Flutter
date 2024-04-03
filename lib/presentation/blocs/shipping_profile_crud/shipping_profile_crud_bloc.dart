import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/shipping_profile/shipping_profile_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'shipping_profile_crud_event.dart';
part 'shipping_profile_crud_state.dart';
part 'shipping_profile_crud_bloc.freezed.dart';

@injectable
class ShippingProfileCrudBloc
    extends Bloc<ShippingProfileCrudEvent, ShippingProfileCrudState> {
  ShippingProfileCrudBloc(ShippingProfileCrudUseCase shippingProfileCrudUseCase)
      : _useCase = shippingProfileCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Delete>(_delete);
    on<_Update>(_update);
    on<_Create>(_create);
  }

  void _load(_Load event, Emitter<ShippingProfileCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when((shippingProfile) => emit(_ShippingProfile(shippingProfile)),
        (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<ShippingProfileCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(queryParams: event.queryParameters);
    result.when(
        (response) => emit(_ShippingProfiles(
            response.shippingProfiles ?? [], response.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  void _delete(_Delete event, Emitter<ShippingProfileCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
        (response) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  void _update(_Update event, Emitter<ShippingProfileCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(
        id: event.id,
        userUpdateShippingProfileReq: event.userUpdateShippingProfileReq);
    result.when((shippingProfile) => emit(_ShippingProfile(shippingProfile)),
        (error) => emit(_Error(error)));
  }

  void _create(_Create event, Emitter<ShippingProfileCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.userCreateShippingProfileReq);
    result.when((shippingProfile) => emit(_ShippingProfile(shippingProfile)),
        (error) => emit(_Error(error)));
  }

  final ShippingProfileCrudUseCase _useCase;
  static ShippingProfileCrudBloc get instance =>
      getIt<ShippingProfileCrudBloc>();
}
