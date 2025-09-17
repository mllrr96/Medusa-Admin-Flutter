import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/api_keys/domain/usecases/api_key/api_key_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'api_key_crud_event.dart';
part 'api_key_crud_state.dart';
part 'api_key_crud_bloc.freezed.dart';

@injectable
class ApiKeyCrudBloc extends Bloc<ApiKeyCrudEvent, ApiKeyCrudState> {
  ApiKeyCrudBloc(ApiKeyUseCase apiKeyUseCase)
      : _useCase = apiKeyUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Delete>(_delete);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Revoke>(_revoke);
    on<_AddSalesChannels>(_addSalesChannels);
    on<_RemoveSalesChannels>(_removeSalesChannels);
  }

  void _load(_Load event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.load(event.id);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(
        queryParameters: {'limit': pageSize, ...?event.queryParameters});
    result.when((success) => emit(_ApiKeys(success.apiKeys, success.count)),
        (error) => emit(_Error(error)));
  }

  void _delete(_Delete event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  void _create(_Create event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.title, event.type);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  void _update(_Update event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.update(event.id, event.title);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  void _revoke(_Revoke event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.revoke(event.id);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  void _addSalesChannels(
      _AddSalesChannels event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.addSalesChannels(event.id, event.salesChannelsIds);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  void _removeSalesChannels(
      _RemoveSalesChannels event, Emitter<ApiKeyCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.removeSalesChannels(event.id, event.salesChannelsIds);
    result.when(
        (success) => emit(_ApiKey(success)), (error) => emit(_Error(error)));
  }

  final ApiKeyUseCase _useCase;
  static int pageSize = 10;
  static ApiKeyCrudBloc get instance => getIt<ApiKeyCrudBloc>();
}
