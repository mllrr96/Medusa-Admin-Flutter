import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/sales_channel/sales_channel_crud_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'sales_channel_crud_event.dart';
part 'sales_channel_crud_state.dart';
part 'sales_channel_crud_bloc.freezed.dart';

@injectable
class SalesChannelCrudBloc
    extends Bloc<SalesChannelCrudEvent, SalesChannelCrudState> {
  SalesChannelCrudBloc(this.salesChannelCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
    on<_DeleteProducts>(_deleteProducts);
    on<_AddProducts>(_addProducts);
  }

  void _load(_Load event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.load(id: event.id);
    result.when((success) => emit(_SalesChannel(success)),
        (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.loadAll(
      queryParameters: {
        'limit': pageSize,
        ...?event.queryParameters,
      },
    );
    result.when(
        (success) => emit(
            _SalesChannels(success.salesChannels ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  void _create(_Create event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result =
        await salesChannelCrudUseCase.create(event.userSalesChannelCreateReq);
    result.when((success) => emit(_SalesChannel(success)),
        (error) => emit(_Error(error)));
  }

  void _update(_Update event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.update(
        id: event.id,
        userSalesChannelUpdateReq: event.userSalesChannelUpdateReq);
    result.when((success) => emit(_SalesChannel(success)),
        (error) => emit(_Error(error)));
  }

  void _delete(_Delete event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.delete(event.id);
    result.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  void _deleteProducts(
      _DeleteProducts event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.removeProducts(
        id: event.id, productIds: event.productIds);
    result.when((success) => emit(_SalesChannel(success)),
        (error) => emit(_Error(error)));
  }

  void _addProducts(
      _AddProducts event, Emitter<SalesChannelCrudState> emit) async {
    emit(const _Loading());
    final result = await salesChannelCrudUseCase.addProducts(
        id: event.id, productIds: event.productIds);
    result.when((success) => emit(_SalesChannel(success)),
        (error) => emit(_Error(error)));
  }

  static SalesChannelCrudBloc get instance => getIt<SalesChannelCrudBloc>();
  final SalesChannelCrudUseCase salesChannelCrudUseCase;
  static int pageSize = 20;
}
