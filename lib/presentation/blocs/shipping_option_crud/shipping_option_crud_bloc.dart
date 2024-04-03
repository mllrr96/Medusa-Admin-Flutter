import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/shipping_option/shipping_option_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'shipping_option_crud_event.dart';
part 'shipping_option_crud_state.dart';
part 'shipping_option_crud_bloc.freezed.dart';

@injectable
class ShippingOptionCrudBloc
    extends Bloc<ShippingOptionCrudEvent, ShippingOptionCrudState> {
  ShippingOptionCrudBloc(ShippingOptionCrudUseCase shippingOptionCrudUseCase)
      : _useCase = shippingOptionCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }

  Future<void> _load(_Load event, Emitter<ShippingOptionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when((shippingOption) => emit(_ShippingOption(shippingOption)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(
      _LoadAll event, Emitter<ShippingOptionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(queryParams: {
      'limit': pageSize,
      ...?event.queryParameters
    });
    result.when(
      (response) => emit(_ShippingOptions(
          response.shippingOptions ?? [], response.count ?? 0)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(
      _Create event, Emitter<ShippingOptionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.userCreateShippingOptionReq);
    result.when(
      (response) => emit(_ShippingOption(response)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _update(
      _Update event, Emitter<ShippingOptionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(
        id: event.id,
        userUpdateShippingOptionReq: event.userUpdateShippingOptionReq);
    result.when(
      (response) => emit(_ShippingOption(response)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(
      _Delete event, Emitter<ShippingOptionCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
      (response) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  final ShippingOptionCrudUseCase _useCase;
  static const int pageSize = 20;
  static ShippingOptionCrudBloc get instance => getIt<ShippingOptionCrudBloc>();
}
